function [Dialled_num,GoertzelArray] = DTMF_Decoder(dtmf_output,Num_of_samples)
F_s = 8000;
F_m = [697 770 852 941 1209 1336 1477 1633];
k = calculateK(Num_of_samples,F_s,F_m);
vsum = 0;
for K_ind = 1 : length(k)
    
    y = GoertzelAlgorithm(dtmf_output,k(K_ind),Num_of_samples);
    
    if (K_ind == 1)                                         
         y1(1 : Num_of_samples) = y( 1 : Num_of_samples);  
     else
          vsum = vsum + Num_of_samples;
          y1(vsum + 1 : vsum + Num_of_samples) = y( 1: Num_of_samples);
      end
    y_max(K_ind) = max(y);
end
GoertzelArray = y_max;
temp = y_max(1);
temp1 = 1;
for s = 2:8
   if (y_max(s) > temp)
        temp = y_max(s);
        temp1 = s ;
   end
end
             
y_max(temp1) = 0;
temp2 = y_max(1);
temp3 = 1;
for s = 2:8
   if (y_max(s) > temp2)
       temp2 = y_max(s);
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
