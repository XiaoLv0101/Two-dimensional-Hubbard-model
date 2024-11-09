%Sorter
clc
clear
%Clear the workspace

N=128;
%Set the precision

x=-pi:2*pi/(N-1):pi;
y=-pi:2*pi/(N-1):pi;
%Define grid coordinates

z=zeros(N);
%Define the energy grid

for s=1:N
    for j=1:N
        z(s,j)=-(2*cos(x(s))+2*cos(y(j)));
    end
end
%Calculate the energy of the system

[X,Y]=meshgrid(x,y);
%Establish a grid

mesh(X,Y,z) 
%Draw a three-dimensional image

z_vector=z(:);
%Transpose the matrix where the energy data is stored to one dimension

[sorted_z_vector,index]=sort(z_vector,'ascend');
%Sort the system energy

[row,col]=ind2sub(size(z),index);
%Extract the position corresponding to the sorted system energy

sorted_x_vector=round(x(col)./(2*pi)*N);
sorted_y_vector=round(y(row)./(2*pi)*N);
%Convert them into coordinates

fid=fopen('data.txt','wt');
%Create a 'data' file

for i=1:N^2
    fprintf(fid,'%d\t%d\t%d\r\n',sorted_x_vector(i),sorted_y_vector(i),sorted_z_vector(i));
end
%Write the data to the file

fclose(fid);
%stop