%Density of states
clc
clear
%Clear the workspace

N=1000;
%Set the precision

k=200;
%Set the number of grid points

x=linspace(-5,5,k);
y=linspace(-5,5,k);
%Create the x-axis and y-axis

r=zeros(1,k);
%Establish a density of states matrix

eta=0.005;
%Sets the width of the Dirac function

for n=1:k
%Go through the loops of each grid

    for i=0:N
        for j=0:N
    %Cycle through each grid in the mesh

            kx=2*pi*i/N;
            ky=2*pi*j/N;
            delte=-2*(cos(kx)+cos(ky));
            %Calculate delta

            r(n)=r(n)+eta/((x(n)-delte)^2+eta^2)/(pi*N^2);
            %Calculate the energy density

        end
    end
    rtot(n)=trapz(x,r);
    %The density of states is integrated

end
figure;
%Open the Paint window

plot(x,r);
%Drawing density map

hold on
%Make the next diagram based on this diagram

plot(x,rtot)
xlabel('Emesh')
ylabel('density')
%Draw an integral density diagram

grid on
%Set up grid