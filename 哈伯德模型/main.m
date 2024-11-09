%Main program
clc;
clear;
%Clear the workspace

N=128;
%Set the precision

Ntot=N^2/2;
%Count the total number of electrons

tpin=2*pi/N;
%Transpose

U=0.25:0.01:10;                       %输出m，E图时注释该行
%Set the precision of U

%s=1;                                   %输出m，U图时注释该行
%U=10;                                   %输出m，U图时注释该行
t=1;
%Initialize the data

filename='data.txt';
%Open the file data

dataTable=readtable(filename);
vector_x=dataTable.Var1;
vector_y=dataTable.Var2;
vector_z=dataTable.Var3;
%Read the file

for s=1:length(U)                     %输出m，E图时注释该行
%Loop over U

    c=1;
    %Guidelines for initializing arrays

for Nup=0:Ntot
    Ndn=Ntot-Nup;
%Go through the cycle of each grid

    denup=Nup/N^2;
    dendn=Ndn/N^2;
    n(c) = (Nup-Ndn)/(Ntot);
    %Calculate m

    efup=0;
    efdn=0;
    %Initialize system energy

    for i=1:Nup
        efup=efup+vector_z(i)+U(s)*dendn;
    end
    for i=1:Ndn
        efdn=efdn+vector_z(i)+U(s)*denup;
    end
    %The system energies for upward spin and downward spin are calculated separately
    
    E(c) =((efup+efdn)/N^2)-U(s)*denup*dendn;
    %Sum the energy of each grid

    c=c+1;
    %The guide to the next matrix

end
%plot(n,E);                             %输出m，U图时注释该行
title('t=1 U=0:10 N=128 n=0.5');       %记得改标题
xlabel('m')
ylabel('E')
%Output m-E images

E_=transpose(E);
n_=transpose(n);
%Transpose the matrix

A=[n_,E_];
[~,minE]=min(A(:,2));
minn=A(minE,1);
%Find out the m corresponding to the smallest system energy

mn(s)=minn;
%Fill it in the matrix

end                                   %输出m，E图时注释该行
plot(U,mn)                            %输出m，E图时注释该行
xlabel('U')                           %输出m，E图时注释该行
ylabel('mmin')                        %输出m，E图时注释该行

grid on
%Set up grid
