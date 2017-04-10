#* ************************************************************************** *#
#*                                                                            *#
#*                                                        :::      ::::::::   *#
#*   Makefile                                           :+:      :+:    :+:   *#
#*                                                    +:+ +:+         +:+     *#
#*   By: dlouise <davidlouiz@gmail.com>             +#+  +:+       +#+        *#
#*                                                +#+#+#+#+#+   +#+           *#
#*   Created: 2015/09/12 02:05:18 by dlouise           #+#    #+#             *#
#*   Updated: 2016/09/23 21:59:08 by dlouise          ###   ########.fr       *#
#*                                                                            *#
#* ************************************************************************** *#

.PHONY : clean, fclean, re, test
.SUFFIXES :

NAME = libftasm.a

SRC = ft_isascii.s ft_isalpha.s ft_isdigit.s

OBJ = $(SRC:.s=.o)

all : $(NAME)

$(NAME) : $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

%.o : %.s
	nasm -f macho64 $^ -o $@

clean :
	rm -f $(OBJ)
	rm test.o

fclean : clean
	rm -f $(NAME)
	rm test

test: $(NAME)
	gcc -Wall -Werror -Wextra -c test.c
	gcc -Wall -Werror -Wextra *.o -o test
	./test

re : fclean all
