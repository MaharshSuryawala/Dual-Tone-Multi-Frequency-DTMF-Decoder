function  Goertzel_array = goertzel_algo (sig_array,K,Num_of_samples)
 fst_stg(1) = 0;           % First stage output array 1 and 2 have been initialised
 fst_stg(2) = 0;           % to '0' because there is no negative array
 
 lst_stg(1)=0;
 lst_stg(2)=0;
 
 for v = 3:Num_of_samples                 % the recursive function
         fst_stg(v)= sig_array(v) + (2 * cos(( 2 * pi * K) / Num_of_samples)* fst_stg(v-1)) - fst_stg(v-2);
         sec_stg(v) = fst_stg(v) - ( fst_stg(v-1) * exp((-1) * 2 * i * K ));
         lst_stg(v) = abs(sec_stg(v)); 
         
  end
  Goertzel_array = lst_stg;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%