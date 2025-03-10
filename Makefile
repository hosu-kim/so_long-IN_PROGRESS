# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hoskim <hoskim@student.42prague.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/04 20:39:28 by hoskim            #+#    #+#              #
#    Updated: 2025/03/10 16:27:16 by hoskim           ###   ########seoul.kr   #
#                                                                              #
# **************************************************************************** #

NAME = so_long
CC = clang
CFLAGS = -Wall -Wextra -Werror -g

MLX = -Lmlx -lmlx -lXext -lX11 -lm
SRCS_DIR = srcs/
MAIN_DIR = $(SRCS_DIR)main/
MAP_MANAGER_DIR = $(SRCS_DIR)map_manager/
GAME_MANAGER_DIR = $(SRCS_DIR)game_manager/
UTILS_DIR = $(SRCS_DIR)utils/

SRCS = $(MAIN_DIR)so_long.c \
		$(GAME_MANAGER_DIR)events.c \
		$(GAME_MANAGER_DIR)game.c \
		$(GAME_MANAGER_DIR)render.c \
		$(GAME_MANAGER_DIR)windows.c \
		$(MAP_MANAGER_DIR)map_elements.c \
		$(MAP_MANAGER_DIR)map_path.c \
		$(MAP_MANAGER_DIR)map_path_helpers.c \
		$(MAP_MANAGER_DIR)map_reader.c \
		$(MAP_MANAGER_DIR)map_utils.c \
		$(MAP_MANAGER_DIR)map.c \
		$(UTILS_DIR)memory.c \
		$(UTILS_DIR)string_utils.c \
		$(UTILS_DIR)utils.c

OBJS = $(SRCS:.c=.o)
INCLUDES = -Iincludes -Imlx

all: $(NAME)

$(NAME): $(OBJS)
		$(MAKE) -C mlx
		$(CC) $(CFLAGS) $(OBJS) $(MLX) -o $(NAME)

%.o: %.c
		$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(MAKE) -C mlx clean
	rm -f $(OBJS)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re