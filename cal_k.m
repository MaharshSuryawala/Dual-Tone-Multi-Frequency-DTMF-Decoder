function k = cal_k(Num_of_samples,Fs,Fm)
len_Fm = length(Fm);
k1(1:len_Fm) = ((Fm(1:len_Fm) * Num_of_samples)/Fs);% for N = 205
%  the K values are fine is "CEIL" except for two "25" and"35" which has to be "FLOOR"   
for i = 1 : len_Fm
    if (ceil(k1(i)) - k1(i)) >= 0.5    % if the diff between Ceil and real value 
        k(i) = floor(k1(i));             % is less than 0.5 -> ceil the value
    else                                 %  else floor it 
        k(i) = ceil(k1(i));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
