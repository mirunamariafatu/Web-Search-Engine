function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  # Deschide fisierul din care se va citi graful
  in = fopen(nume);
  
  # Citeste numarul de noduri 
  N = fscanf(in, '%f', 1);
   
  # Initializeaza matricile
  A = zeros (N,N);
  k = zeros (N,N);
   
  # Contor care determina daca paginile au link catre ele insele 
  found = 0;
   
  # Creeaza matricea adiacenta A
  for i = 1 : N
    
   found = 0;
   node = fscanf(in, '%f',1); # Numarul nodului
   links = fscanf(in,'%f', 1); # Numarul de vecini 
   
   for j = 1 : links
     page = fscanf(in, '%f', 1); # Noduri vecine
     
     if page != i  # Ignora cazul in care pagina are link catre ea insasi
     A(i, page) = 1;
     else
     found++;  # Pagina are link catre ea insasi
     endif
     
    endfor
    
    k(i, i) = links - found; # Actualizeaza numarul de linkari valide
    
  endfor
  
  fclose(in);
  
  # Creeaza matricea K
  K = eye(N);
  for i= 1 : rows(K)
       K(i, i) = 1 / k(i, i);
  endfor
   
  # Calculeaza matricea M cu formula din documentatie
  M = (K * A)';
  
  # Determina inversa matricii I - d * M folosind Gram-Schmidt optimizat
  I = eye (N);
  matrix = I - d * M;
  inv_matrix = PR_Inv(matrix);
  
  % Determina R prin agloritmul Algebraic
  R = inv_matrix * (1 - d ) / N * ones(N, 1);
  
endfunction