#ifndef LIBFT_ASM
# define LIBFT_ASM

#include <ctype.h>
#include <string.h>

int		ft_isascii(int c);
int		ft_isalpha(int c);
int		ft_isprint(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);

int		ft_tolower(int c);
int		ft_toupper(int c);

void	ft_bzero(void *s, size_t n);

char	*ft_strcat(char *dst, char *src);
char	*ft_strdup(char *src);

int		ft_puts(char *s);

size_t	ft_strlen(char *s);

void	ft_memset(void *b, int c, size_t len);
void	*ft_memcpy(void *b, void *c, size_t len);

#endif
