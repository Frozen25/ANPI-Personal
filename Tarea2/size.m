function size(x)
  lambda = 0.1;
  h_i = double(1);
  i = 1;
  #size of vector
  while (h_i > 1*10^(-15))
    i+=1;
    h_i = lambda*h_i;
  endwhile
  size = i
  
endfunction