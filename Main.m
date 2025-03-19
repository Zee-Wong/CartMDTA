% CartMDTA ---- A Cartesian Coordinate Molecular Dynamics Trajectories Analyzer 
% Version 1.0   
% Last update: 2025.1.24 
% Developer: Ziyi Wang from Chongqing University, China
% E-mail: wzycsust@163.com 
% *** Please feel free to contact me if you have any problem ***
% *** Question, Bug Report, Discussion, Suggestion are all welcome ***

clear,clc 

%输入参数
Path='C:\Users\Ziyi Wang\Desktop\大论文\AIMD-Redu\-30\1-pos-1.xyz'; %Txt路径
Lines=312312; %Txt行数
Num=1001; %步数
Timemin=5;  %判断成键的步数间隔，比如成键间隔为25fs，单次时间步长为0.5fs，步数间隔为50.
cycle=1001; %想要计算的步数，需大于步数间隔Timemin。

Atom=Lines/Num-2; %原子数

Traj=ReadTxt(Path,Lines,Num); %读取轨迹

BondStep=zeros(Atom,Atom,Atom); %多步数成键矩阵的三维存储矩阵
Final=zeros(cycle,5); % 分子数目结果矩阵

for i=1:cycle;  %步数计算循环
    
    BondX=zeros(Atom);  %多步成键中间矩阵
    
    % 距离矩阵
    traj=Traj((i-1)*Atom+1:i*Atom,2:4);
    dist=pdist(traj);
    Dist=squareform(dist);
    
    % 成键矩阵(需进入子函数更改成键判标)
    Bond=BondMat(Traj,Dist,Atom);
    
%   多步数判断成键
    BondStep(:,:,i)=Bond;
    if i>=Timemin;
        Bondsum=sum(BondStep(:,:,(i-Timemin+1):i),3); %三维空间像间隔步数方向按需求步数压缩（如50步       
        for is=1:Atom;
            for js=1:Atom;
                if Bondsum(is,js)==Timemin;
                    BondX(is,js)=1;
                end
            end
        end
    end
    Bond=BondX;

    % 团簇形成
    Clus=ClusMat(Bond,Atom);

    % 判断原子数,需进入修改原子类型数
    AtomNum=AtomMat(Clus,Traj);

    % 判断键数
    BondNum=BondSeri(Clus,Bond);

    % 判断分子类型
    % 1-EC 2-DEC 3-CO3 4-C2H4 5-CO  
    % 可进入函数修改判据
    Mol=IsMol(BondNum,AtomNum);

    Final(i,:)=Mol;
    
    display(i);
end

    Final(1:Timemin,:)=[]; %  去掉前面的Timemin行数据





