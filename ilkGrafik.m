ort = zeros(1,7);
betas=30:10:90;
for n=1:7
addpath C:\Users\seker\Desktop\gems\
clear beta;
j=0;
beta_total = 0;
for m=1:10
i = 20+n*10;
x = zeros(1,i);
y = zeros(1,i);

for k=1:i 
x(k) = 200*rand();
y(k) = 200*rand();
end

d=zeros(i);
for k=1:i
    for l=1:i
        d(k,l)=sqrt((x(k)-x(l))^2+(y(k)-y(l))^2);
    end
end

e=zeros(i);
for k=1:i
    for l=1:i
        if(d(k,l)<=19.3)
            e(k,l)=671.88;
        elseif(d(k,l)<=20.46)
            e(k,l)=687.5;
        elseif(d(k,l)<=21.69)
            e(k,l)=703.13;
        elseif(d(k,l)<=22.69)
            e(k,l)=705.73;
        elseif(d(k,l)<=24.38)
            e(k,l)=710.94;
        elseif(d(k,l)<=25.84)
            e(k,l)=723.96;
        elseif(d(k,l)<=27.39)
            e(k,l)=726.56;
        elseif(d(k,l)<=29.03)
            e(k,l)=742.19;
        elseif(d(k,l)<=30.79)
            e(k,l)=757.81;
        elseif(d(k,l)<=32.62)
            e(k,l)=773.44;
        elseif(d(k,l)<=34.58)
            e(k,l)=789.06;
        elseif(d(k,l)<=36.66)
            e(k,l)=812.5;
        elseif(d(k,l)<=38.86)
            e(k,l)=828.13;
        elseif(d(k,l)<=41.19)
            e(k,l)=843.75;
        elseif(d(k,l)<=43.67)
            e(k,l)=867.19;
        elseif(d(k,l)<=46.29)
            e(k,l)=1078.13;
        elseif(d(k,l)<=49.07)
            e(k,l)=1132.81;
        elseif(d(k,l)<=52.01)
            e(k,l)=1135.42;
        elseif(d(k,l)<=55.13)
            e(k,l)=1179.69;
        elseif(d(k,l)<=58.44)
            e(k,l)=1234.38;
        elseif(d(k,l)<=61.95)
            e(k,l)=1312.5;
        elseif(d(k,l)<=65.67)
            e(k,l)=1343.75;
        elseif(d(k,l)<=69.61)
            e(k,l)=1445.31;
        elseif(d(k,l)<=73.79)
            e(k,l)=1500.01;
        elseif(d(k,l)<=78.22)
            e(k,l)=1664.06;
        elseif(d(k,l)<=82.92)
            e(k,l)=1984.38;
        end
    end
end
x(1)=100;
y(1)=100;
createGDX(x,y,d,e,i);

gams('C:\Users\seker\Desktop\gems\hopCount_Figure1.gms');

beta.name = 'beta_min';
beta=rgdx('C:\Users\seker\Desktop\gems\Result',beta);
beta_min=beta.val;

if(beta_min>0)
beta_total=beta_total+beta_min;
j=j+1;
end
clear beta
end
ort(n)=beta_total/j;
end
plot(betas,ort)