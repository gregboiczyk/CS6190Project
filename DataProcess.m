data = readmatrix('IndexChange.csv');
D = data(1:length(data)-1,2:end)'; %drop date column and drop final date in dataset
%Normalize data
D = (D-min(D))./(max(D)-min(D));
%Make vector of up/down returns
SP = data(2:end,2); %get S&P data from 2nd to last samples. 
SPUp = double(SP > 0); %Array of returns
%D is matrix of previous day returns. SPUp is what want to predict
%Split into training and test data:
DTrain = D(:,1:2000);
DTest = D(:,2001:end);
SPUpTrain = SPUp(1:2000);
SPUpTest = SPUp(2001:end);
writematrix(DTrain,'DTrain.csv')
writematrix(DTest,'DTest.csv')
writematrix(SPUpTrain,'tTrain.csv')
writematrix(SPUpTest,'tTest.csv')