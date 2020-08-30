function [dtmf_output,Numofsamples] = DTMF_Generator(dial_num,Numofsamples)
Fs = 8000;            % Sampling frequency
Ts = 1/Fs;
T = Ts*(0:Numofsamples-1)';
switch dial_num
case 0
    F1 = 941;
    F2 = 1336;
case 1
    F1 = 697;
    F2 = 1209;
case 2
    F1 = 697;
    F2 = 1336;
case 3
    F1 = 697;
    F2 = 1477;
case 'A'
    F1 = 697;
    F2 = 1633;
case 4
    F1 = 770;
    F2 = 1209;
case 5
    F1 = 770;
    F2 = 1336;
case 6
    F1 = 770;
    F2 = 1477;
case 'B'
    F1 = 770;
    F2 = 1633;
case 7
    F1 = 852;
    F2 = 1209;
case 8
    F1 = 852;
    F2 = 1336;
case 9
    F1 = 852;
    F2 = 1477;
case 'C'
    F1 = 852;
    F2 = 1633;
case '*'
    F1 = 941;
    F2 = 1209;
case '#' 
    F1 = 941;
    F2 = 1477;
otherwise
    F1 = 941;
    F2 = 1633;
end
first_sine = cos(2*pi*F1*T);           % first sinusoidal signal
second_sine = cos(2*pi*F2*T);           % second sinusoidal signal
%dtmf_output = first_sine + second_sine;
d = first_sine + second_sine;
dtmf_output = d;
% Generating Tones
sound(dtmf_output);
% figure(1);
% title('THE DTMF OUTPUT');
% plot(dtmf_output);