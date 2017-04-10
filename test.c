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

char	*ft_strdup(char *s, char *s1)
{
	int i = 0;

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
			return (0);
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

int		main(void)
{
	test_isX(ft_isascii, isascii, "ft_isascii");
	test_isX(ft_isalpha, isalpha, "ft_isalpha");
	test_isX(ft_isdigit, isdigit, "ft_isdigit");
//	str = strdup(str, "Hello World!\n");	
//	printf("str before b_zero %s\n", str);
//	printf("verifying String == %d\n", verify_str(str, s_len(str));
//	printf("str after b_zero %s\n", str);
//	printf(42);
	return (0);
}
