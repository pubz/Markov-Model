%filename = 'F:\Research - CS\OBDataAnalysis';
%sheet = 'TestingMATLAB';

%filename = 'F:\DataLogs\OrderBook\OBStatesProcessed\20170403';
%sheet = 'OB States 1230 - 0430';
%filename = 'F:\DataLogs\OrderBook\OBStatesProcessed\20170404';
%sheet = 'OB States 1248 - 1445';
%filename = 'F:\DataLogs\OrderBook\OBStatesProcessed\20170406';
%sheet = 'OB States 1231 - 1518';
filename = 'F:\DataLogs\OrderBook\OBStatesProcessed\20170409';
sheet = 'OB States 1232 - 1730';

Matrix = xlsread(filename,sheet);
[rows, columns] = size(Matrix);
temporary = [1,1];
oldFactorValue = []; newFactorValue = []; difference =[];
Y = ones(1,1); % 0, -1, +1
X = ones(1,1); %numbers 1,2,3
stateFactors = ones(1,1); %state factors 

increment = 1;

for row = 1 : 6 : rows*0.01
    temporary =calculateStateFactor(Matrix(row:row+4,1:7));
    
    if row == 1
        oldFactorValue = temporary;
        
    end 
    if row ~= 1
        %disp(temporary)
        stateFactors(increment-1, :) = temporary*1e4;
        %disp('>>>>>>>')
        %disp(stateFactors)
        %disp('>>>>>.>>')
        newFactorValue = temporary;
        difference = newFactorValue - oldFactorValue;
        oldFactorValue = newFactorValue;
        disp(temporary)
        if difference < 1e-2 && difference > -1e-2       %diff between -0.00001 and 0.00001
            %disp('stable')
            Y(increment-1, :) = 1; %0
        end
        if difference < -1e-2
            %disp('negative difference')
            Y(increment-1, :) = 2; %-1
        end
        if difference > 1e-2
            %disp('Positive difference')
            Y(increment-1, :) = 3; %1
        end
    end  
    X(increment, :)= increment;
    
    %disp('------------------------------------------')
    increment = increment + 1;
    
end 
%disp(X)
%disp(stateFactors)
%disp('---------------*****------------------')

disp(Y)
%plot(X,Y)
%disp('---------------*****------------------')
%[estimateTR,estimateE] = hmmestimate(Y,Y);
%disp(estimateTR)
%disp(estimateE)

%disp(run_hmm(stateFactors, Y, 3))

trans = [  0.9618    0.0189    0.0193;
    0.8909    0.0152    0.0940;
    0.9362    0.0638         0];
em = [1     0     0;
     0     1     0;
     0     0     1];
 
[seq,states] = hmmgenerate(54,trans,em); 
disp('@@@@@@@@@')
disp(seq)
disp('@@@@@@@@@')
disp(states) 
