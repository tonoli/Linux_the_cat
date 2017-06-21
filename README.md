# cat_linux
A C function that reads any valid file line by line until the end.

### What is cat_linux?

Cat_linux is a [42][2] project where you needed to build a function called get_next_line that basically reads a file line by line.

Disclaimer: *There [are][10] [so][11] [many][12] [easier][13] methods of doing this by using standard C functions. But the goal here is to be able to do it by using any functions from my libft which are the basic libc functions you need to code yourself when starting 42 and only the standard functions `read`, `malloc` and `free`.*

### Why would I use/try it?

You probably will never have to use this function if you are not a 42 student. The goal is to get better at C. As I said above, you can only use those three standard library functions:

* read
* malloc
* free

So it makes the project harder. But you can also use functions from your [personal library][14].

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
