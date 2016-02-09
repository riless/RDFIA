function [ confusionMatrix , nGoodCat ] = multiClassPrediction( predictclassifieurs , imCatTest )

idx = 1;
nbCat = 15;
confusionMatrix = zeros(nbCat ,nbCat);
for cat_i = 1 :nbCat ;
    pos = idx + imCatTest(cat_i,1) -1;
    reste = predictclassifieurs(:,idx: pos);
    idx = idx + imCatTest(cat_i,1);
    for i = 1 : imCatTest(cat_i,1);
      [~,y] = max(reste(:,i));
      confusionMatrix(y,cat_i) = confusionMatrix(y,cat_i)+1;
    end    
end

for i = 1 : nbCat;
    confusionMatrix(i,:) = (confusionMatrix(i,:) ./ imCatTest')*100;
end

nGoodCat = diag(confusionMatrix);
nGoodCat =nGoodCat';
confusionMatrix = confusionMatrix';
end