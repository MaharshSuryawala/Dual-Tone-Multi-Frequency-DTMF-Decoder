function [Dialled_num,Goertzel_array] = DTMF_Decoder(dtmf_output,Num_of_samples)
Fs = 8000;
Fm = [697 770 852 941 1209 1336 1477 1633];
k = cal_k(Num_of_samples,Fs,Fm);
v_sum = 0;
for K_ind = 1 : length(k)
    
    y = goertzel_algo(dtmf_output,k(K_ind),Num_of_samples);
    
    if (K_ind == 1)                                        % this appends each Kth array to 
         y1(1 : Num_of_samples) = y( 1 : Num_of_samples);  % the output array
     else
          v_sum = v_sum + Num_of_samples;
          y1(v_sum + 1 : v_sum + Num_of_samples) = y( 1: Num_of_samples);
      end
    ymax(K_ind) = max(y);
end
Goertzel_array = ymax;
% To find the two maximum peaks
temp = ymax(1);
temp1 = 1;
for s = 2:8
   if (ymax(s) > temp)
        temp = ymax(s);
        temp1 = s ;
   end
end
             
ymax(temp1) = 0;
temp2 = ymax(1);
temp3 = 1;
for s = 2:8
   if (ymax(s) > temp2)
       temp2 = ymax(s);
       temp3 = s;
   end
end
dialnum = ['1' '2' '3' 'A';'4' '5' '6' 'B';'7' '8' '9' 'C';'*' '0' '#' 'D'];
   
if (temp1 > temp3)
     temp = temp1;
     temp1 = temp3;
     temp3 = temp;
end
Dialled_num = dialnum(temp1,(temp3-4));
