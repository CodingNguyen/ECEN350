# LAB01 Example Makefile
#
# This makefile is intended for use with GNU make
# This example is intended to be built with Linaro bare-metal GCC

TARGET=q11
CC=gcc
LD=gcc

FLAGS=-g -O0

all: $(TARGET)

clean:
	rm *.o
	rm $(TARGET)

main.o: main.c
# Compile for best debug view (lowest optimization)
	$(CC) $(FLAGS) -c $^  -o $@

fact.o: fact.S
# Compile for best debug view (lowest optimization)
	$(CC) $(FLAGS) -c $^ -o $@

# test2.o: test2.S
# # Compile for best debug view (lowest optimization)
# 	$(CC) $(FLAGS) -c $^ -o $@



$(TARGET): main.o fact.o
	$(LD) main.o fact.o -o $@
