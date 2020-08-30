function  GoertzelArray = GoertzelAlgorithm(sigArray,K,Numofsamples)
 firstStage(1) = 0;           
 firstStage(2) = 0;           
 
 lastStage(1)=0;
 lastStage(2)=0;
 
 for v = 3:Numofsamples                 % the recursive function
         firstStage(v)= sigArray(v) + (2 * cos(( 2 * pi * K) / Numofsamples)* firstStage(v-1)) - firstStage(v-2);
         secstg(v) = firstStage(v) - ( firstStage(v-1) * exp((-1) * 2 * i * K ));
         lastStage(v) = abs(secstg(v)); 
         
  end
  GoertzelArray = lastStage;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%