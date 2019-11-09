symbol = {'1','2','3','4','5','6','7','8','9','*','0','#'};
Fs = 8000;
Ts = 1/Fs;
N=320;
%[dtmf_output,Num_of_samples,SNR] = DTMF_Generator(1,Num_of_samples,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[dtmf_output1,N] = DTMF_Generator(1,N);
pause(1);
[dtmf_output2,N] = DTMF_Generator(2,N);
pause(1);
[dtmf_output3,N] = DTMF_Generator(3,N);
pause(1);
[dtmf_output4,N] = DTMF_Generator(4,N);
pause(1);
[dtmf_output5,N] = DTMF_Generator(5,N);
pause(1);
[dtmf_output6,N] = DTMF_Generator(6,N);
pause(1);
[dtmf_output7,N] = DTMF_Generator(7,N);
pause(1);
[dtmf_output8,N] = DTMF_Generator(8,N);
pause(1);
[dtmf_output9,N] = DTMF_Generator(9,N);
pause(1);
[dtmf_output10,N] = DTMF_Generator(0,N);
pause(1);
[dtmf_output11,N] = DTMF_Generator('*',N);
pause(1);
[dtmf_output12,N] = DTMF_Generator('#',N);
pause(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
x1 = subplot(4,4,1);
plot(x1,dtmf_output1);
title("1");

x2 = subplot(4,4,2);
plot(x2,dtmf_output2);
title("2");

x3 = subplot(4,4,3);
plot(x3,dtmf_output3);
title("3");

x4 = subplot(4,4,4);
plot(x4,dtmf_output4);
title("4");

x5 = subplot(4,4,5);
plot(x5,dtmf_output5);
title("5");

x6 = subplot(4,4,6);
plot(x6,dtmf_output6);
title("6");

x7 = subplot(4,4,7);
plot(x7,dtmf_output7);
title("7");

x8 = subplot(4,4,8);
plot(x8,dtmf_output8);
title("8");

x9 = subplot(4,4,9);
plot(x9,dtmf_output9);
title("9");

x0 = subplot(4,4,10);
plot(x0,dtmf_output10);
title("1");

x11 = subplot(4,4,11);
plot(x11,dtmf_output11);
title("*");

x12 = subplot(4,4,12);
plot(x12,dtmf_output12);
title("#");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tones = [dtmf_output1,dtmf_output2,dtmf_output3,dtmf_output4,dtmf_output5,dtmf_output6,dtmf_output7,dtmf_output8,dtmf_output9,dtmf_output10,dtmf_output11,dtmf_output12];
% Nt = 205;
% original_f = [697, 770, 852, 941, 1209, 1336, 1477];  % Original frequencies
% k = round(original_f/Fs*Nt);  % Indices of the DFT
% estim_f = round(k*Fs/Nt);      % Frequencies at which the DFT is estimated
% tones = tones(1:205,:);
% for toneChoice = 1:12
%     % Select tone
%     tone = tones(:,toneChoice);
%     % Estimate DFT using Goertzel
%     ydft(:,toneChoice) = goertzel(tone,k+1); % Goertzel uses 1-based indexing   
% end

[Dialled_num,Goertzel_array] = DTMF_Decoder(dtmf_output2,N);
figure;

stem(Goertzel_array)
xticks('auto');
xticklabels({'R1', 'R2', 'R3', 'R4', 'C1', 'C2', 'C3', 'C4'});




