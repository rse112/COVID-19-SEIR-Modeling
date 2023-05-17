clear all;
clc;
close all;
data_T = [1 27 12 44 67 136 152 54 184 340 296 742 512 517 520 398 326 367 390 297 190 92];
data_K = [0 5 4 17 106 39 19 44 36 53 74 75 48 108 59 95 81 122 65 32 25 10];
data_TK = data_K +data_T;

%% Daegu/Gyeongbuk

%% datafit->beta,betaf predict
%datafit_3;


%% call_inital_condition
t = initialize_condition_TK(data_TK);


%%t = calculation_TK
t = calculation_TK(t);

%% plot confirmed date
%plot_cinfirmed_TK(data_TK,t);


%% Nationwide
clear all;
clc;
data = [2 34 16 74 190 209 206 129 252 447 427 909 593 684 599 516 437 518 483 366 247 131];

%%  predict parameter

datafit_nation;

%% incall_inital_condition
t = initialize_condition_Nation(data);

%% calculation
t = calculation_Nation(t);

%% plot_cinfirmed_nation
plot_cinfirmed_nation(data,t);

