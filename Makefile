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

NAME = libfts.a

SRC = ft_isascii.s ft_isalpha.s ft_isalnum.s ft_isdigit.s ft_isprint.s ft_bzero.s\
	  ft_strcat.s ft_tolower.s ft_toupper.s ft_puts.s ft_strlen.s ft_memset.s \
	  ft_memcpy.s ft_strdup.s ft_cat.s ft_islower.s ft_isupper.s ft_isspace.s \
	  ft_strchr.s ft_puts_fd.s

OBJ = $(SRC:.s=.o)

all : $(NAME)

$(NAME) : $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

%.o : %.s
	nasm -f macho64 $^ -o $@

clean :
	rm -f $(OBJ)

fclean : clean
	rm -f $(NAME)

test: $(NAME)
	gcc -Wall -Werror -Wextra -c test.c
	gcc -Wall -Werror -Wextra $(OBJ) test.o -o test
	./test

re : fclean all
