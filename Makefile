CC = gcc
makerom: makerom.c
	$(SHELL %time%)
	$(CC) makerom.c -o makerom -Wall -Wextra -pedantic -std=c99 -Wa,-aslh > makerom.txt