FATU MIRUNA-MARIA
311 CA

Tema 2 - In spatele unui motor de cautare

-> Cerinta 1:
Iterative:
	- Deschid fisierul din care se va citi graful
	- Citesc numarul de resurse web pe care le vom analiza (N)
	- Extrag datele din fisier folosind doua for-uri.
	- Creez matricea de adiacenta punand 1 pe pozitia A(i,j) daca j se afla in lista de pagini vecine a lui i,
	  in caz contrar, A(i,j) = 0.
	- Folosesc contorul found, acesta fiind incrementat la identificarea unei pagini care linkeaza catre ea insasi.
	- In matricea k stochez pe diagonala doar numarul de linkari valide, fara link-urile catre pagina insasi.
	- Construiesc inversa matricei k, K folosind proprietatea matematica din documentatie.
	 (k este matrice diagonala -> inversa ei este inversul elementelor de pe diagonala principala)
	- Execut algoritmul de determinare a rezultatului pana cand diferenta dintre R si R la pasul anterior < eps

-> Cerinta 2:
Algebraic:
	- Ma folosesc de algoritmul implmentat la cerinta anterioara, citirea elementelor si crearea matricei de adiacenta fiind identica.
	- Determin inversa matricei cu ajutorul algoritmului Gram-Schmidt optimizat intrucat minimizeaza numarul de erori fata de GS clasic,
	  rezolvand apoi un sistem superior triunghiular cu n ecuatii.
	- Aplic formula din documentatie pt a afla R

PR_Inv:
	- Initializeaz R si Q
	- Calculez R si Q pe baza algoritmului Gram-Schimdt optimizat astfel incat R * Q = A.
	- Creez inversa rezolvand un sistem superior triunghiular cu ajutorul functiei SST.

-> Cerinta 3:
Apartenenta:
	- Pentru a indeplini conditia de functie continua, am aplicat conditia de coliniaritate pentru parametrii a si b, 
	  determinandu-i astfel:
		a * val1 + b = 0
		a * val2 + b = 1  -> prin scadere obtinem a = 1/ (val2 - val1) si b =  (-1) * val1 / (val2 - val1);
	- Se determina rezultatul in functie de caz

PageRank:
	- Creez fisierul de iesire concatenand '.out' la numele fisierului de intrare
	- Citesc datele din fisierul de intrare
	- Afisez numarul de resurse web care urmeaza sa fie analizate (N).
	- Apelez functia Iterative si afisez vectorul PR (R1) obtinut prin acest algoritm.  
	- Apelez functia Algebraic si afisez vectorul PR (R2) obtinut prin acest algoritm. 
	- In vectorul idx retin indicii vectorului R2.
	- Cu ajutorul a doua for-uri sortez descrescator valorile din PR1, ordonand si indicii acestora
	 pentru a pastra corespondenta valoare-indice.
	- Afisez clasamentul paginilor web.

Mentiune: Pentru implementarea algoritmilor Gram-Schimdt si SST am plecat de la formulele prezentate in cadrul laboratoarelor 2 si 3 de MN.

Feedback: 
	   Consider ca aceasta tema a avut un nivel de dificultate mediu, prezentandu-ne o aplicare practica a metodelor		
 	 numerice invatate in cadrul acestei materii. Astfel, daca pana acum credeam ca sugestiile facute de Google sunt
	 determinate printr-un algoritm extrem de complex, prin aceasta tema am invatat ce se afla de fapt in spatele acestuia.  
	
	  

