function [Traj]=ReadTxt(Path,Lines,Num)

% % 调试用
% Path='C:\Users\Ziyi Wang\Desktop\AIMD\2.txt'; %Txt路径
% Lines=1156; %Txt行数
% Num=2; %步数

Atom=Lines/Num-2; %原子数
m=Lines;  %Txt行数

fid=fopen(Path);
data=zeros(m,100);
for i=1:m;
    temp=fgetl(fid);
    n=length(temp);
    data(i,1:n)=temp;
end
fclose(fid);

stru=zeros(Atom*Num,4);
for j=1:Num;
    stru((j-1)*Atom+1:j*Atom,1)=data(((j-1)*(Atom+2)+3):(j*(Atom+2)),3); % Lable
    stru((j-1)*Atom+1:j*Atom,2)=str2num(char(data(((j-1)*(Atom+2)+3):(j*(Atom+2)),5:24))); %x
    stru((j-1)*Atom+1:j*Atom,3)=str2num(char(data(((j-1)*(Atom+2)+3):(j*(Atom+2)),25:44))); %y
    stru((j-1)*Atom+1:j*Atom,4)=str2num(char(data(((j-1)*(Atom+2)+3):(j*(Atom+2)),45:64))); %z
end

Traj=stru;

end



