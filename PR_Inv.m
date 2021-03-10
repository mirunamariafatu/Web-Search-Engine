function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
  
  [m n] = size(A); 
  
  # Initializeaza matricile Q si R
  Q = zeros (n);
  R = zeros (n);
  
  # Gram-Schmidt optimizat pentru a spori acuratetea
  for k = 1 : n
    
    R(k, k) = norm(A(:, k));
    Q(:, k) = A(:, k) / R(k, k);
    
    for p = k + 1 : n
      R(k, p) = Q(:, k)' * A(:, p);
      A(:, p ) = A(:, p) - Q(:, k) * R(k, p);
    endfor
  
  endfor

  # Initializez matricea B -> va reprezenta inversa
  B = zeros (n);
  
  I = eye (n);
  
  # Determina inversa prin rezolvarea unui sistem superior-triungiular
  # cu n ecuatii  
  for i = 1 : n
    x_i = SST(R, Q' * I(:, i));
    B(:, i) = x_i;
  endfor
  
  endfunction