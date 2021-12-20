% HOMEWORK-1 
% Step 1: Run the following code on Matlab and see the figure
% Step 2: Explain each line briefly for example for the following line
% y = s + 10^(-Eb_N0_dB(ii)/20)*n 
% 10^(-Eb_N0_dB(ii)/20) converts from DB to voltage level and multily with
% n that is noise to be able to change level of noise. THIS ÝS CORRECT
% EXPLANATION. But if you just say it adds s to 10^(-Eb_N0_dB(ii)/20)*n, it
% is not correct
% Step 3: Answer the following question 
% What should be ylabel?
% What should be title?
% What is the error at 10 dB?
% Step 4: run  scatterplot(s);grid on  and copy the figure.
% Explain the figure.
% Step 5: run scatterplot(n);grid on and copy the figure.
% Explain the figure.
% Step 6: run scatterplot(y);grid on and copy the figure.
% Explain the figure.
% Step 7: change Eb_N0_dB = [-3:10];  to Eb_N0_dB = [-3:40]; 
% run scatterplot(y);grid on and copy the figure
% compare the figure step 6 and explain the difference 

clear;
N = 10^6 
rand('state',100); randn('state',200);
ip = rand(1,N)>0.5; 
s = 2*ip-1; n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; 
Eb_N0_dB = [-3:40]; 
for ii = 1:length(Eb_N0_dB)
   y = s + 10^(-Eb_N0_dB(ii)/20)*n; 
   ipHat = real(y)>0;
   nErr(ii) = size(find([ip- ipHat]),2);
end
simBer = nErr/N;
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); 
close all; figure ; semilogy(Eb_N0_dB,theoryBer,'b.-');
hold on; semilogy(Eb_N0_dB,simBer,'mx-');
axis([-3 10 10^-5 0.5]); grid on ;legend('theory', 'simulation');
xlabel('Eb/No, dB'); ylabel('.................');
title(' .............................................');