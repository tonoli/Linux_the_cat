# cat_linux
A C function that reads any valid file line by line until the end.

### What is cat_linux?

Cat_linux is a 42 project where you needed to build a function called get_next_line that basically reads a file line by line.

Disclaimer: *There are so many easier methods of doing this by using standard C functions. But the goal here is to be able to do it by using any functions from my libft which are the basic libc functions you need to code yourself when starting 42 and only the standard functions `read`, `malloc` and `free`.*

### Why would I use/try it?

You probably will never have to use this function if you are not a 42 student. The goal is to get better at C. As I said above, you can only use those three standard library functions:

* read
* malloc
* free

So it makes the project harder. But you can also use functions from your personal C lib.

After finishing this project, you'll definitely learn some more about static variables, pointers, arrays, linked lists (if you decide to do the bonus part), dynamic memory allocation and file manipulation.

My code is not the best, but it passed all the 42 tests successfully.

### How do I use it?

I added a main file called **main.c**, it takes a file name as an argument, opens it and passes the file descriptor (fd) to get_next_line until get_next_line returns -1 or 0.

**Note:** get_next_line returns -1, 0, 1 depending on wether an error has occurred, the reading has been completed or a line has been read respectively.

Alright, so first of all, download/clone this repo:

	git clone https://github.com/tonoli/cat_linux
	
Get into it and build the library:
	
	cd cat_linux
	make -C libft/

Give it some time to compile all the files.

Build the executable:
	
	gcc -Wall -Wextra -Werror -I./libft/includes/ -L./libft -lft -o gnl get_next_line.c main.c

-I tells the compiler where your library header files are. `./libft/includes/` in this case

-L tells it where your library resides. `./libft` here

-l takes the name of your library. This is the set of characters that come after `lib` in your library name.

**NOTE:** -L and -l might look a little bit too much, you could replace those flags with `libft/libft.a` if you want.

Alright, the last command created a `cat_linux` executable in your directory. Now test it with:

	./cat_linux m83.txt

It should read the whole file to you. Kinda like a basic `cat` implementation without the options.

**NOTE:** The lyrics in the text file are from [Claudia Lewis][15] by [M83][16] ;)

##How did I came up with this function? 

#Rappels : 
 
int Read (int fd, char * buf, int BUFF_SIZE) 
read renvoi = 1 quand il arrive lire  n octets sans arriver à la fin du fichier
read renvoi = 0 quand il arrive en fin de fichier 
read renvoi = -1 en cas d’erreur
 
* ft_stock_to_line
 
Contexte : ret renvoi 0 et stock != NULL (i.e. dans une lecture précédente nous avons “trop” lu et avons placé l'excès de lecture dans la var statique stock)
 
Objectif: le but de cette fonction est de mettre dans line la première ligne qui apparaît dans stock et placer le pointeur de stock après le \n s’il y en a. 
 
Explication:
tmp = stockage de ce qu’il reste de stock lors de la première occurrence de ‘\n’ 
len = la longueur de la ligne qu’on traite
on copie len caractères de stock vers line
si le pointeur tmp est non NULL (i.e. il reste au moins une autre ligne dans stock) on avance le pointeur tmp de 1 pour ne pas commencer le nouveau stock par \n
on fait désormais pointer stock sur le premier char après le \n de tmp! 
et on retourne 1! 
 
* ft_stocker
 
Contexte : ret renvoi le nombre d’octets lus et stock peut être NULL ou contenir le début de la ligne qui a été lu par une lecture précédente qui a “trop” lu
 
Objectif : le but de cette fonction est de join ce qu’il y a dans le (char *)buff (correspondant a la fin de (char *)line) et le début de (char *)line qui se trouve dans (char *)stock. Il doit également placer dans stock le reste du buffer après le \n.
 
Si (char *)stock contenait déjà une ligne il faut la mettre dans line et mettre ce qu’il y a dans le buff a la suite de stock
Si ni (char *)stock ni (char *)buf ne contiennent des \n il faut stocker lire encore jusqu'à trouver le \n dans (char *)buf : mettre stock + debut de buff jusqu’au \n et mettre le reste de buf après le \n dans stock
 
 
Explication:   
ft_stocker va retourner 1 quand il aura placé correctement la ligne dans (char *)line si non il revoit 0
if (stock == NULL)  
 
Fonctions secondaires 
char *ft_strcjoin (char *s1, char *s2, int i) 
cette fonction permet de join s1 + s2 si i = 0  et s2 + s1 si i = 1
 

