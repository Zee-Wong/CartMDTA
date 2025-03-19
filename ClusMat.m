function [Clus]=ClusMat(Bond,Atom)

% 原子连接矩阵
Conn=zeros(Atom); %连接关系,团簇较少，团簇内原子较多时，增加列数。
for i=1:Atom;
    n=1;
    for j=1:Atom;
        if Bond(i,j)==1;
        Conn(i,n)=j;
        n=n+1;
        end
    end
end
    
for X=1:3; %防漏循环     
    for i=1:Atom;
       for j=1:Atom;
               top=find(Conn(i,:)==0);
          if Conn(i,j)~=0;
              for n=1:length(top);
                  if Conn(Conn(i,j),n)==0 & Conn(Conn(i,j),n+1)==0 & Conn(Conn(i,j),n+2)==0; % 3连0break，1.2个0会有特殊情况
                      break
                  elseif isempty(find(Conn(i,:)==Conn(Conn(i,j),n)));
                     Conn(i,top(1)+n-1)=Conn(Conn(i,j),n);  
                  end
              end
          end
       end
    end
end

Conn=sort(Conn,2); %升序
Conn=fliplr(Conn); %翻转
Conn=unique(Conn,'rows'); %查重

Clus=Conn;

end