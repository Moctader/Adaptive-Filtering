%% Load
signals=load('signals.mat');
mhb=(signals.mhb)
fhb=(signals.fhb);
abd_sig1=(signals.abd_sig1);
abd_sig2=(signals.abd_sig2);
abd_sig3=(signals.abd_sig3);
RespReference=(signals.RespReference);
RRiInput=(signals.RRiInput);

%% 1  Case A
fig1=figure
subplot(3,1,1);

time_mhb=linspace(1,length(mhb)/1000,length(mhb))/2;

plot(time_mhb,mhb);


title('mhb signal with respect to time')
ylabel('mhb')
xlabel('time in s')

%% 2     
figure(fig1);
subplot(3,1,2);
plot(time_mhb,abd_sig1)
title('abd_sig1 with respect to time')
ylabel('abd_sig1')
xlabel('time in s')
my_lms_filter=dsp.LMSFilter('Method','LMS','Length',1,'StepSize',0.4/186);
[y,e]=my_lms_filter(mhb,abd_sig1);

%% 3
figure(fig1);
subplot(3,1,3);
plot(time_mhb,fhb,'b');
hold on
plot(time_mhb,e,'r');


cor_1 =corrcoef(fhb(2000:10000),e(2000:10000));
Mse_1=immse(fhb(2000:10000),e(2000:10000))

%%  case B
fig2=figure
subplot(3,1,1);
time_mhb=linspace(1,length(mhb)/1000,length(mhb));
plot(time_mhb,mhb);
title('mhb signal with respect to time')
ylabel('mhb')
xlabel('time in s')

figure(fig2);
subplot(3,1,2);
plot(time_mhb/2,abd_sig2)
title('abd_sig2 with respect to time')
ylabel('abd_sig2')
xlabel('time in s')
my_lms_filter=dsp.LMSFilter('Method','LMS','Length',1,'StepSize',0.4/186);
[y,e]=my_lms_filter(mhb,abd_sig2);

figure(fig2);
subplot(3,1,3);
plot(time_mhb/2,fhb,'b');
hold on
plot(time_mhb/2,e,'r');

cor_2 =corrcoef(fhb(2000:10000),e(2000:10000));
Mse_2=immse(fhb(2000:10000),e(2000:10000));

%% Case C

fig3=figure
subplot(3,1,1);
time_mhb=linspace(1,length(mhb)/1000,length(mhb));
plot(time_mhb,mhb);
title('mhb signa3 with respect to time')
ylabel('mhb')
xlabel('time in s')

figure(fig3);
subplot(3,1,2);
plot(time_mhb/2,abd_sig3)
title('abd_sig3 with respect to time')
ylabel('abd_sig3')
xlabel('time in s')
my_lms_filter=dsp.LMSFilter('Method','LMS','Length',21,'StepSize',0.99/186);
[y,e]=my_lms_filter(mhb,abd_sig3);

figure(fig3);
subplot(3,1,3);
plot(time_mhb/2,fhb,'b');
hold on
plot(time_mhb/2,e,'r');

cor_3 =corrcoef(fhb(2000:10000),e(2000:10000));
Mse_3=immse(fhb(2000:10000),e(2000:10000));

%% 8 case D

fig4=figure;
subplot(3,1,1);
plot(time_mhb(1:1596),RRiInput)
title('RRiInput with respect to time')
ylabel('RRiInput')
xlabel('time in s')

figure(fig4);
subplot(3,1,2);
plot(time_mhb(1:1596),RespReference)
title('RespReference with respect to time')
ylabel('RespReference')
xlabel('time in s');

my_lms_filter=dsp.LMSFilter('Method','LMS','Length',11,'StepSize',0.97/93);
[y,e]=my_lms_filter(RespReference,RRiInput);

time_mhb1=linspace(0,length(RespReference)/1000,length(RespReference))
figure(fig4);
subplot(3,1,3);
plot(time_mhb1,RespReference,'b');
hold on
plot(time_mhb1,y,'r');

cor_4 =corrcoef(RespReference,y);
Mse_4=immse(RespReference,y);

title('RespReference Vs RRiInput')




