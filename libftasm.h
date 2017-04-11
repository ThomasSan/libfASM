#ifndef LIBFT_ASM
# define LIBFT_ASM

#include <ctype.h>
#include <string.h>

int		ft_isascii(int c);
int		ft_isalpha(int c);
int		ft_isprint(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);

void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *dst, char *src);

#endif
