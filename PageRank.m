function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  in = fopen(nume);
  
  # Creeaza fisierul de iesire
  file_out = strcat(nume, '.out'); 
  out = fopen(file_out, 'w');
  
  # Citirea si afisarea numarului de resurse web
  N = fscanf(in, '%d', 1);
  fprintf(out, '%d \n\n', N)
  
  # Determinarea vectorului PR prin algoritmul Iterative
  # Scrierea in fisier
  R1 = Iterative(nume, d, eps);
  
  for i = 1 : N
    fprintf(out, '%.6f \n', R1(i));
  endfor
    fprintf(out, '\n');
  
  # Determinarea vectorului PR prin algoritmul Algebraic
  # Scrierea in fisier
  R2 = Algebraic(nume, d);
  for j = 1 : N
    fprintf(out, '%.6f \n', R2(j));
  endfor
  fprintf(out, '\n');
  
  # Este parcurs fisierul pana se ajunge la datele dorite
  for i = 1 : N
   node = fscanf(in, '%f',1);
   links = fscanf(in, '%f', 1);
   for j = 1 : links
     page = fscanf(in, '%f', 1);
    endfor 
  endfor
  
  # Citire valori
  val1 = fscanf(in, '%f',1);
  val2 = fscanf(in, '%f',1);
  
  # Determinarea indicilor vectorului R2
  idx = zeros (N);
  for i=1 : N
    idx(i) = i;
  endfor

  # Sorteaza descrescator rezultatul
  PR1 = R2;
  for i = 1 : N -1
  	for j = i + 1 : N
  		if PR1(i) < PR1(j)
        
        # Ordonarea valorilor
			  tmp = PR1(i) ;
			  PR1(i) = PR1(j);
			  PR1(j) = tmp;
        
        # Ordonarea indicilor 
        tmp1 = idx(i);
        idx(i) = idx(j);
        idx(j) = tmp1;
        
		  endif
	  endfor
  endfor
  
  # Realizarea clasamentului paginilor web
  for k = 1 : N
    fprintf(out, '%d ',k);
    fprintf(out, '%d ', idx(k));
    F = Apartenenta(PR1(k), val1, val2);
    fprintf(out, '%.6f \n', F);
  endfor
  
  fclose(in);
  
  fclose(out)
  
endfunction