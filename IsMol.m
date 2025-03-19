function [Mol]=IsMol(BondNum,AtomNum)
    
    n=length(BondNum);
    
    EC=0;
    for i=1:n;
        if AtomNum(i,1)==3 & AtomNum(i,2)==4 & AtomNum(i,4)==3 %& BondNum(i)==39;
            EC=EC+1;
        end
    end
    
    DEC=0;
    for i=1:n;
        if AtomNum(i,1)==5 & AtomNum(i,2)==10  & AtomNum(i,4)==3 %& BondNum(i)==2;
            DEC=DEC+1;
        end
    end
    
    CO3=0;
    for i=1:n;
        if AtomNum(i,1)==1 & AtomNum(i,4)== 3 %& BondNum(i)==3;
            CO3=CO3+1;
        end
    end
    
    C2H4=0;
    for i=1:n;
        if AtomNum(i,1)==2 & AtomNum(i,2)==4 & AtomNum(i,4)==0 %& BondNum(i)==2;
            C2H4=C2H4+1;
        end
    end
    
    CO=0;
    for i=1:n;
        if AtomNum(i,1)==1 & AtomNum(i,4)== 1 ;
            CO=CO+1;
        end
    end
    
    Mol=[EC,DEC,CO3,C2H4,CO];
    
end
    
    
    