function [] = createGDX2(xval, yval,d,e,num_of_nodes)
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here

index.name = 'i';
index.val = transpose(linspace(1,num_of_nodes,num_of_nodes));
index.type = 'set'; 

x.name = 'x';
x.val=xval;
x.type='parameter';
x.form='full';
x.uels={[1:num_of_nodes]};

y.name = 'y';
y.val=yval;
y.type='parameter';
y.form='full';
y.uels={[1:num_of_nodes]};


distance.name = 'd';
distance.val = d;
distance.type='parameter';
distance.form='full';
distance.dim = 2; 

energy.name = 'e';
energy.val = e;
energy.type='parameter';
energy.form='full';
energy.dim = 2; 

wgdx('C:\Users\seker\Desktop\gems\lo.gdx',index,x,y,distance,energy);

end

