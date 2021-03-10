function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
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
   node = fscanf(in, '%f',1);  # Numarul nodului
   links = fscanf(in,'%f', 1); # Numarul de vecini 
   
   for j = 1 : links
     page = fscanf(in, '%f', 1); # Noduri vecine
     
     if page != i # Ignora cazul in care pagina are link catre ea insasi
     A(i, page) = 1;
     else
     found++; # Pagina are link catre ea insasi
     endif
   
    endfor
    k(i, i) = links - found; # Actualizeaza numarul de linkari valide
  endfor
  
  fclose(in);
  
  # Creeaza matricea K
  K = eye(N);
  
  for i = 1 : rows(K)
       K(i, i) = 1/k(i, i);
  endfor
   
  # Calculeaza matricea M cu formula din documentatie
  M = (K * A)';
  
  R_prev(1 : N, 1) = 1 / N; # R la pasul initial
  
  # Aplica algoritmul Iterative
  R = (d .* M * R_prev) + (((1 - d) / N) * ones(N, 1)); 
  
  while(norm(R - R_prev) > eps)
  R_prev = R;
  R = (d * M * R_prev) + (((1 - d) / N) * ones(N, 1));
  endwhile
 
  # Actualizeaza vectorul R pentru care conditia a fost indeplinita
  R = R_prev;
  
  endfunction