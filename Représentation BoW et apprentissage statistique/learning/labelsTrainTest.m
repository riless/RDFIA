function [ y, ytest ] = labelsTrainTest( nTrain,ntest, imCat , i )

    cate = categories();
    ncat = length(cate);
    % apprentissage d'un classifieur binaire pour chaque categorie
    y = zeros(ncat*nTrain,1);
    ytest = zeros(ntest,1);

    cpt = 1;
    cptTest=1;
    for j=1:ncat
        for k=1:nTrain
            if(i==j)
                y(cpt,1) = 1;
            else
                y(cpt,1) = -1;
            end

            cpt = cpt+1;
        end
        for k=nTrain+1:imCat(j,1)
            if(i==j)
                ytest(cptTest,1) = 1;
            else
                ytest(cptTest,1) = -1;
            end

            cptTest = cptTest+1;
        end
    end

end

