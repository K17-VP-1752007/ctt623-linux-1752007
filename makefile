#makefile    cai nao define r ko define nua
exo1 : f1.o f3.o prog1.o
    gcc f1.o f3.o prog1.o -o exo1
f1.o : f1.c f1.h
    gcc -Wall -c f1.c
f3.o : f3.c f2.h f3.h
    gcc -Wall -c f3.c
prog1.o : prog1.c f1.h f3.h
    gcc -Wall -c prog1.c

exo2 : f1.o f2.o f4.o prog2.o
    gcc f1.o f2.o f4.o prog2 -o exo2
f2.o : f2.c f2.h
    gcc -Wall -c f2.c
f4.o : f4.c f4.h
    gcc -wall -c f4.c
prog2.o : prog2.c f1.h f2.h f4.h
    gcc -Wall -c prog2.c 
all : exo1 exo2 #cau 3
clean : 
#cau 5 muon makedepend phai cai makedepend
depend :
	makedepend prog1.c prog2.c f1.c f2.c f3.c f4.c