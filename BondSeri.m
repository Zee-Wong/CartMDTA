function [BondNum]=BondSeri(Clus,Bond)

    Bondsum=sum(Bond,2);
    [m,n]=size(Clus);
    Bondarray=zeros(m,n);
    for i=1:m;
        for j=1:n;
            if Clus(i,j)~=0;
            Bondarray(i,j)=Bondsum(Clus(i,j));
            end
        end
    end
    BondNum=sum(Bondarray,2);
    BondNum=BondNum/2;

end