function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
	
  # Obtin parametrii a si b din conditia de coliniaritate
  a = 1 / (val2 - val1);
  b =  (-1) * val1 / (val2 - val1);
  
  # Calculeaza rezultatul functiei
  if x >= 0 && x < val1
    y = 0;
  elseif x >= val1 && x <= val2
    y = a * x + b;
  elseif x > val2 && x <= 1 
    y = 1;
  endif
    
endfunction
    