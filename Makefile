CC = gcc
FLEX = flex

all: _scanner

_scanner: scanner/scanner.o scanner/main.o
	$(CC) scanner/scanner.o scanner/main.o -o $@

scanner/scanner.o: scanner/scanner.c scanner/token.h
	$(CC) -c $< -o $@

scanner/scanner.c: scanner/scanner.flex
	$(FLEX) -o $@ $<

scanner/main.o: scanner/main.c scanner/token.h
	$(CC) -c $< -o $@

.PHONY:
clean:
	$(RM) scanner/*.o scanner/scanner.c scanner/_scanner