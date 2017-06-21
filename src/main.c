/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: itonoli- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/01/17 12:38:23 by itonoli-          #+#    #+#             */
/*   Updated: 2017/06/20 23:35:51 by itonoli-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/get_next_line.h"

int     main(int argc, char **argv)
{
	int     fd;
	char    *line;
	if (argc != 2)
	{
		ft_putendl("usage : ./get_it file1 file2 ... file3");
		return (0);
	}
	if ((fd = open(argv[1], O_RDONLY)) == -1)
	{
		ft_putendl("open () failed");
		return (0);
	}
	while (get_next_line(fd, &line) == 1)
	{
		ft_putendl(line);
		ft_strdel(&line);
	}
	if ((close(fd)) == -1)
		ft_putendl("close () failed");
	return (0);
}
