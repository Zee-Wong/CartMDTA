function [AtomNum]=AtomMat(Clus,Traj)

    [m,n]=size(Clus);
    AtomNum=zeros(m,4); %列数为原子类型数
    for i=1:m;
        Cnum=0;
        Hnum=0;
        Nnum=0;
        Onum=0;
        top=find(Clus(i,:)==0);
        n=top(1);
        for j=1:n-1;
            if Traj(Clus(i,j),1)==67;
                Cnum=Cnum+1;
            elseif Traj(Clus(i,j),1)==72;
                Hnum=Hnum+1;
            elseif Traj(Clus(i,j),1)==78;
                Nnum=Nnum+1;          
            elseif Traj(Clus(i,j),1)==79;
                Onum=Onum+1;  
            else
                display Unexpected_Atom
            end
        end
     AtomNum(i,:)=[Cnum,Hnum,Nnum,Onum];
    end

end