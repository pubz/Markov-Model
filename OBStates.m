filename = 'F:\Research - CS\OBDataAnalysis';
sheet = 'TestingMATLAB';
Matrix = xlsread(filename,sheet);
[rows, columns] = size(Matrix);
Trade = [];
Buy = []; Sell = [];
X = [];
oldAvgPrice = [];
newAvgPrice = [];

for row = 1 : 6 : rows %rows 6=step
    if row ~= rows-4 %neglect last OB State
        oldState = Matrix(row:row+4 , 1:7);
        newState = Matrix(row+6:row+10 , 1:7);
        stateChange = oldState - newState;
        %Caluculate average price for the Old State
        Buy = oldState(1,4);
        Sell = oldState(1,5);
        X = Buy + Sell;
        oldAvgPrice = X / 2;
        %disp(oldAvgPrice)
        
        %Caluculate average price for the New State
        Buy = newState(1,4);
        Sell = newState(1,5);
        X = Buy + Sell;
        newAvgPrice = X / 2;
        %disp(newAvgPrice)
        
        %disp(stateChange)
                
        if (oldAvgPrice == newAvgPrice) && stateChange(1,6)>0
            disp('Stable')
        end  
        
        if (oldAvgPrice<newAvgPrice) 
            disp('Increased')
        end 
        
        if (oldAvgPrice>newAvgPrice)   
            disp('Decreased')        
        end     
    end
end    


