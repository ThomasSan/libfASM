#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include "libftasm.h"

int		s_len(char *s)
{
	int i = 0;
	while (s[i])
		i++;
	return (i);
}

int		verify_str(char *s, int len)
{
	int i = 0;
	while (i < len)
	{
		if (s[i] != 0)
		{
			printf("Error at %d char\n", i);
			return (0);
		}
		i++;
	}
	return (1);
}

int		test_isX(int f(int), int of(int), char *s)
{
	int i = -320;
	while (i < 320)
	{
		if (f(i) != of(i))
		{
			printf("Error for function %s for i = %d (%d)\n", s, i, f(i));
			return (-1);
		}
		i++;
	}
	printf("%s function passed\n", s);
	return (0);
}

void	test_puts(void)
{
	size_t len1;
	size_t len2;

	if ((len1 = ft_puts("Hello World!")) != (len2 = puts("Hello World!")))
		printf("Err with return Value on ft_puts('Hello World!')  %zu => %zu\n", len1, len2);
	if ((len1 = ft_puts("")) != (len2 = puts("")))
		printf("Err with return Value on ft_puts('') %zu => %zu\n", len1, len2);
	if ((len1 = ft_puts(NULL)) != (len2 = puts(NULL)))
		printf("Err with return Value on ft_puts(NULL) %zu => %zu\n", len1, len2);
}

void	test_puts_fd(int fd)
{
	ft_puts_fd("Hello World!", fd);
	ft_puts_fd("", fd);
	ft_puts_fd(NULL, fd);
}

int		main(void)
{
	char *str;
	char str1[20];
	char str2[20];
	int	len;

	printf("<--------------- Tests ft_is() ------------------->\n");
	test_isX(ft_isascii, isascii, "ft_isascii");
	test_isX(ft_isalpha, isalpha, "ft_isalpha");
	test_isX(ft_isprint, isprint, "ft_isprint");
	test_isX(ft_isalnum, isalnum, "ft_isalnum");
	test_isX(ft_isdigit, isdigit, "ft_isdigit");
	test_isX(ft_isupper, isupper, "ft_isupper");
	test_isX(ft_islower, islower, "ft_islower");
	test_isX(ft_isspace, isspace, "ft_isspace");
	
	printf("<--------------- Tests ft_bzero() ------------------->\n");
	str = strdup("Hello World!\n");	
	len = s_len(str);
	printf("str before b_zero %s\n", str);
	ft_bzero(str, len);
	printf("verifying String == %d\n", verify_str(str, len));
	
	printf("<--------------- Tests ft_strcat() ------------------->\n");
	strcpy(str1, "Mabite");
	strcpy(str2, "ta soeur");
	ft_strcat(str1, str2);
	printf("%s\n", str1);

	printf("<--------------- Tests ft_to() ------------------->\n");
	test_isX(ft_toupper, toupper, "ft_toupper");
	test_isX(ft_tolower, tolower, "ft_tolower");

	printf("<--------------- Tests ft_puts() ------------------->\n");
	test_puts();

	printf("<--------------- Tests ft_strlen() ------------------->\n");

	printf("strlen(Hello World!) = %zu -> %zu\n", ft_strlen("Hello World!"), strlen("Hello World!"));
	printf("strlen() = %zu -> %zu\n", ft_strlen(""), strlen(""));

	printf("<--------------- Tests ft_strdup() ------------------->\n");

	printf("ft_strdup(Hello World!) = %s\n", ft_strdup("Hello World!"));

	printf("<--------------- Tests ft_strdup() ------------------->\n");
	printf("Mon strchr %s, %s\n", ft_strchr(str1, 'o'), strchr(str1, 'o'));
	printf("Mon strchr %s, %s\n", ft_strchr(str1, 'z'), strchr(str1, 'z'));
	printf("Mon strchr %s, %s\n", ft_strchr(str1, 0), strchr(str1, 0));

	printf("<--------------- Tests ft_puts() ------------------->\n");
	test_puts_fd(2);
	

	printf("<--------------- Tests ft_puts() ------------------->\n");
	int fd;

	fd = open("ft_puts.s", O_RDONLY);
	ft_cat(fd);
	close(fd);
	return (0);
}
