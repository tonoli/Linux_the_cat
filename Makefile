# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: itonoli- <itonoli-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/06/20 20:07:13 by itonoli-          #+#    #+#              #
#    Updated: 2017/06/26 16:09:58 by itonoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#PROGRAM NAME
NAME = cat_linux

#SOURCES AND OBJECTS
SRC_NAME = main.c \
get_next_line.c \

OBJ_NAME = $(SRC_NAME:.c=.o)

SRC_PATH = src/
OBJ_PATH = obj/

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))
#LIB = $(addprefix -I,$(LIB_PATH))

#COMPILATION
CC = gcc
FLAGS = -Wall -Wextra -Werror -I.inc

#LIBRARY
LIBFT  = -L./libft -lft


all: $(NAME)

$(NAME):$(OBJ)
		@ make -C libft/
		@ $(CC) $(FLAGS) $(LIBFT) $^ -o $@
		@ echo "\033[32mCompilation done : cat_linux is ready to be used\033[0m"

$(OBJ_PATH)%.o:$(SRC_PATH)%.c
		@ mkdir -p $(OBJ_PATH)
		@ $(CC) $(FLAGS)  -o $@ -c $<

cat_linux_only:
		@ $(CC) $(FLAGS) -I libft/ -c $(SRC)
		@ $(CC) $(FLAGS) -g -o $(NAME) $(OBJ) $(LIBFT) $(MLX)
		@ echo "\033[32mCompilation done : cat_linux 🍉  is ready to be used\033[0m"

clean:
		@ echo "\033[32mCleaning the following files: \033[0m"
		@ make -C libft/ clean
		@ rm -vf $(OBJ)
		@ rm -rfv $(OBJ_PATH)
		@ echo "\033[32mThe cleaning is done my friend!\033[0m"

fclean: clean
		@ rm -vf $(NAME)
		@ make -C libft/ fclean
		@ echo "\033[32mThe cleaning is done my friend!\033[0m"

norm:
		@ echo "\033[34;1mNorminette...\033[0m"
		@ norminette src inc libft

re: fclean all
