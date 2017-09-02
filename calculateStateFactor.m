
function stateFactor = calculateStateFactor(matrix)
[rows] = size(matrix); 
depth = [5 
         4 
         3 
         2 
         1];
factors = [5,1];
for row = 1 : rows
     factors(row) = ((matrix(row, 3) * matrix(row, 4)) + (matrix(row, 5) * matrix(row, 6))) / (matrix(row, 3) + matrix(row, 6));
     
end

weightedFactors = factors * depth;
stateFactor = weightedFactors/15;

end
