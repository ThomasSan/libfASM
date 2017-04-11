#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "libftasm.h"

int		s_len(char *s)
{
	int i = 0;
	while (s[i])
		i++;
	return (i);
}

char	*ft_strdup(char *s1)
{
	int		i = 0;
	char	*s;

	if (!(s = malloc(sizeof(char) * s_len(s1))))
		return (NULL);
	while (s1[i])
	{
		s[i] = s1[i];
		i++;
	}
	s[i] = '\0';
	return (s);
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
	str = ft_strdup("Hello World!\n");	
	len = s_len(str);
	printf("str before b_zero %s\n", str);
	ft_bzero(str, len);
	printf("verifying String == %d\n", verify_str(str, len));
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


	return (0);
}
