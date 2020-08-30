function k = calculateK(Numofsamples,F_s,F_m)
lenFm = length(F_m);
k_1(1:lenFm) = ((F_m(1:lenFm) * Numofsamples)/F_s);% for N = 205

for i = 1 : lenFm
    if (ceil(k_1(i)) - k_1(i)) >= 0.5     
        k(i) = floor(k_1(i));             
    else                                 
        k(i) = ceil(k_1(i));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
