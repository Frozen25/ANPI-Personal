#sin(e^ (x²))
function [Steps,E_ad,E_at,E_cen] = Tarea2(x)
  lambda = 0.9;
  if !(0.1 <= lambda < 1)
    lambda = 0.5;
  endif
  
  h_i = double(1);
  i = 1;
  
  #size of vector
  size = floor (-15/(log10(lambda)))+2;
  
  Steps = zeros(1,size);
  E_ad = zeros(1,size);
  E_at = zeros(1,size);
  E_cen = zeros(1,size);

  while (i <= size)
    ######################################
    # x
    # Hacia adelante
    x_plus = double(x + h_i);
    # Hacia atras
    x_minus = double(x - h_i);
    ######################################
    #f(x)
    f    = double (sin(e^((  x   )^2 )  ) );
    f_ad = double (sin(e^((x_plus)^2 )  ) );
    f_at = double (sin(e^((x_minus)^2)  ) );
    ######################################
    #f'(x)
    fp_ad  = double( (f_ad - f)/(h_i) );
    fp_at  = double( (f - f_at)/(h_i) );
    fp_cen = double( (f_ad - f_at)/(2*h_i) );
    fp = double(2 * e^((x)^ 2) * cos(e^((x)^2)) );
    ######################################
    #Error relativo fraccional
    Erel_ad  = double( abs((fp-fp_ad)/fp)  );
    Erel_at  = double( abs((fp-fp_at)/fp)  );
    Erel_cen = double( abs((fp-fp_cen)/fp) );
    ######################################
    #save to list
    E_ad(i) = Erel_ad;
    E_at(i) = Erel_at;
    E_cen(i) = Erel_cen;
    Steps(i) = h_i;
    
    i+=1;
    h_i = lambda*h_i;
  endwhile
  
  #ax = plotyy (listH,listA,listH,listB,listH,listC,@loglog,@loglog, @loglog);
  #xlabel ("h");
  #ylabel ("Erel");

  
  x = 0:0.1:2*pi;
  y1 = sin (x);
  y2 = exp (x - 1);
  ax = plotyy (x, y1, x - 1, y2, @plot, @semilogy);
  xlabel ("X");
  ylabel (ax(1), "Axis 1");
  ylabel (ax(2), "Axis 2");
    
  #loglog(Steps,E_ad,'r')
 # loglog(Steps,E_at,'g')
 # loglog(Steps,E_cen, 'b')
  #pause
  
endfunction

