ort = zeros(1,7);
betas=30:10:90;
t_max_sum = zeros(1,3);
t_n = zeros(3,9);
R = 150;
tmax0 = 0;
for n=1:3
addpath C:\Users\seker\Desktop\gems\
clear beta;
j=0;
beta_total = 0;
for m=1:20
i = 30*n;
x = zeros(1,i);
y = zeros(1,i);

for k=1:i
    rnet = rand();
    r = R*sqrt(rnet);
    angle=2*pi*rand();
x(k) = r*cos(angle);
y(k) = r*sin(angle);
end
x(1)=0;
y(1)=0;
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
        else
            e(k,l)=0;
        end
    end
end

createGDX(x,y,d,e,i);

gams('C:\Users\seker\Desktop\gems\hopCount_Figure1.gms');

beta.name = 'beta_min';
beta=rgdx('C:\Users\seker\Desktop\gems\Result',beta);
beta_min=beta.val;
clear beta

if(beta_min>0)
beta_total=beta_total+beta_min;
j=j+1;

createGDX1(beta_min,y,d,e,i,0);
gams('C:\Users\seker\Desktop\gems\hop_count_secondT.gms');
tmax.name = 't';
tmax=rgdx('C:\Users\seker\Desktop\gems\Result2',tmax);
tmax0=tmax.val;
t_max_sum(n)=t_max_sum(n)+tmax.val;
clear tmax;

for z=1:9
a = 0.95+z*0.05;
createGDX1(beta_min,y,d,e,i,a);
gams('C:\Users\seker\Desktop\gems\hop_count_second.gms');
tmax.name = 't';
tmax=rgdx('C:\Users\seker\Desktop\gems\Result1',tmax);
t1 = tmax.val;
t_n(n,z)=t_n(n,z)+(-t1+tmax0)/tmax0;
clear tmax;
end

end




end
ort(n)=ceil(beta_total/j);
t_n(n,:)=t_n(n,:)/j;
end
%plot(betas,ort)

t_max = t_max_sum/40;
t_n_son = t_n/40;
%t_error(1,:)=-t_n_son(1,:)+t_max(1);
%t_error(2,:)=-t_n_son(2,:)+t_max(2);
%t_error(3,:)=-t_n_son(3,:)+t_max(3);
%t_error_rat(1,:) =t_error(1,:)./t_max(1);
%t_error_rat(2,:) =t_error(2,:)./t_max(2);
%t_error_rat(3,:) =t_error(3,:)./t_max(3);
x_axis = 1:0.05:1.4;

hold on
plot(x_axis,t_n(1,:))
plot(x_axis,t_n(2,:))
plot(x_axis,t_n(3,:))
hold off