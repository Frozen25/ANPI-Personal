function [v,ev,ea,n] = anpi_erf(x,k)
  aprox_actual = 0;
  aprox_anterior = 0;
  es = 0.5*10^(2-k);
  i = 0;
  ea = 1;
  while (abs(ea)>es)   
    aprox_anterior = aprox_actual;
    elemento_i = (((-1)^i)*(x^(2*i+1)))/((factorial(i))*(2*i+1));
    aprox_actual += elemento_i;
    ea = (1- (aprox_anterior/aprox_actual))*100;
    i+=1;
  endwhile
  v = aprox_actual*2/(sqrt(pi))
  valor_verdadero = erf(x)  ;
  ev = abs(1- (v/valor_verdadero))*100
  ea = abs(1- (aprox_anterior/aprox_actual))*100
  n = i-1
endfunction


