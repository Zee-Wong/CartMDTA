function [Bond]=BondMat(Traj,Dist,Atom)

    % ASCii C-67 H-72 N-78 O-79
    Bond=zeros(Atom);
    for i=1:Atom;
        for j=1:Atom;
            if Traj(i,1)==67 & Traj(j,1)==67 & Dist(i,j)<2.31;   % C-C
                Bond(i,j)=1;
            elseif Traj(i,1)==67 & Traj(j,1)==72 & Dist(i,j)<1.63;  % C-H
                Bond(i,j)=1;
            elseif Traj(i,1)==72 & Traj(j,1)==67 & Dist(i,j)<1.63;
                Bond(i,j)=1;
            elseif Traj(i,1)==67 & Traj(j,1)==78 & Dist(i,j)<2.20;  % N-C
                Bond(i,j)=1;
            elseif Traj(i,1)==78 & Traj(j,1)==67 & Dist(i,j)<2.20;
                Bond(i,j)=1;
            elseif Traj(i,1)==78 & Traj(j,1)==79 & Dist(i,j)<2.1;  %  N-O
                Bond(i,j)=1;
            elseif Traj(i,1)==79 & Traj(j,1)==78 & Dist(i,j)<2.1;
                Bond(i,j)=1;
            elseif Traj(i,1)==78 & Traj(j,1)==78 & Dist(i,j)<2.17;  % N-N
                Bond(i,j)=1; 
            elseif Traj(i,1)==78 & Traj(j,1)==72 & Dist(i,j)<1.5;  % O-H
                Bond(i,j)=1; 
            elseif Traj(i,1)==72 & Traj(j,1)==78 & Dist(i,j)<1.5;  
                Bond(i,j)=1; 
            elseif Traj(i,1)==67 & Traj(j,1)==79 & Dist(i,j)<2.15;  % O-C
                Bond(i,j)=1; 
            elseif Traj(i,1)==79 & Traj(j,1)==67 & Dist(i,j)<2.15;  
                Bond(i,j)=1; 
            end
        end
    end
    for p=1:Atom;
       Bond(p,p)=0; 
    end    
end