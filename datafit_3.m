function  datafit_3
clear all; close all; clc
%% initialize 

dt=0.01;     % time step

ini_date=1; 
end_date=22; 

tray=ini_date:dt:end_date   ;% time array 
ttemp=ini_date:1:end_date   ;% datafit array 

% data
data = [ 1	32	16	61	173	175	171	98	220	393	370	817	560	625	579	493	407	489	455	329	215	102];
len = length(data);
A = NaN(1,len);
B = NaN(1,len);
for i = 1:1:len
        A(i) = data(i);
        if i == 1
            B(i) = A(i);
        else
            B(i) = B(i-1) + A(i);
        end
end


% Initial values
S(1) = 4963622; Sf(1) = 0; E(1) = 450; I(1) = 110; Q(1) = 1; R(1) = 0; N(1) = S(1)+Sf(1)+E(1)+I(1)+Q(1)+R(1);    
mu = 1/14; tau = 1/1000; delta = 0.02; x = 1/4.1; alpha = 1/4; gamma = 1/14; f = 0.0221;

ini=[1 1];
ub=[10 10];   % upper bound
lb=[0 0];   % lower bound

[y, resnorm]=lsqcurvefit(@ftemp,ini,tray,data,lb,ub,[],S(1),Sf(1),E(1),I(1),Q(1),R(1),N(1),dt);
beta=y(1);
beta_f=y(2);
%% ODE solver
for i=1:length(tray)-1      
    S(i+1) = S(i)+ dt*(-beta*(I(i)/N(i))*S(i)-beta_f*(1-exp(-tau*Q(i)))*S(i));
    Sf(i+1) = Sf(i)+ dt*(beta_f*(1-exp(-tau*Q(i)))*S(i)-delta*beta*(I(i)/N(i))*Sf(i));
    E(i+1) = E(i)+ dt*(beta*(I(i)/N(i))*S(i)+delta*beta*(I(i)/N(i))*Sf(i)-x*E(i));
    I(i+1) = I(i)+ dt*(x*E(i)-alpha*I(i));
    Q(i+1) = Q(i)+ dt*(alpha*I(i)-gamma*Q(i));
    R(i+1) = R(i)+ dt*(gamma*Q(i));
    N(i+1) =  S(i+1)+Sf(i+1)+E(i+1)+I(i+1)+Q(i+1)+R(i+1);
end
%% R^2 computation
% Extract model prediction
%model_prediction = alpha * I;

% Compute correlation coefficient matrix
%cc_matrix = corrcoef(data, model_prediction(1:1/dt:end));

% Extract R^2

%R_square = cc_matrix(1,2)^2;

%fprintf('R^2: %.4f\n', R_square);
%% plot
figure(1)
set(gcf,'color','w');
hold on
%plot(ttemp,data,'ko','markersize',5,'linewidth',1.7)
plot(tray,alpha*I,'linewidth',2)
xlim([ini_date,end_date])
xlabel('Days')
ylabel('Cases')
title(sprintf('\\beta = %.4g, \\beta_f = %.4g ',beta, beta_f))
hold off

% 누적 모델 그래프 생성
figure(2)
set(gcf,'color','w');
hold on
plot(ttemp,B,'ko','markersize',5,'linewidth',1.7)
plot(tray,cumsum(alpha*I*dt),'linewidth',2) % 누적 모델 추가
legend('Data','Cumulative Model') % 범례 추가
xlim([ini_date,end_date])
xlabel('Days')
ylabel('Cases')
title(sprintf('Cumulative Model: \beta = %.4g, \beta_f = %.4g ',beta, beta_f))
hold off
end


%% 
function y=ftemp(v,tray,ini_a,ini_b,ini_c,ini_d,ini_e,ini_f,ini_g,dt)
beta=v(1); beta_f=v(2);
 mu = 1/14; tau = 1/1000; delta = 0.02; x = 1/4.1; alpha = 1/4; gamma = 1/14; f = 0.0221;
S(1)=ini_a; Sf(1)=ini_b; E(1)=ini_c; I(1)=ini_d; Q(1)=ini_e; R(1)=ini_f; N(1)=ini_g;
for i=1:length(tray)-1      
     S(i+1) = S(i)+ dt*(-beta*(I(i)/N(i))*S(i)-beta_f*(1-exp(-tau*Q(i)))*S(i));
    Sf(i+1) = Sf(i)+ dt*(beta_f*(1-exp(-tau*Q(i)))*S(i)-delta*beta*(I(i)/N(i))*Sf(i));
    E(i+1) = E(i)+ dt*(beta*(I(i)/N(i))*S(i)+delta*beta*(I(i)/N(i))*Sf(i)-x*E(i));
    I(i+1) = I(i)+ dt*(x*E(i)-alpha*I(i));
    Q(i+1) = Q(i)+ dt*(alpha*I(i)-gamma*Q(i));
    R(i+1) = R(i)+ dt*(gamma*Q(i));
    N(i+1) =  S(i+1)+Sf(i+1)+E(i+1)+I(i+1)+Q(i+1)+R(i+1);
end
y=alpha*I(1:1/dt:end);
end
