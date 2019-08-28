# makefile configuration
NAME            = portcnt
OBJECTS         = main.o

# base
MSPBASE=/cygdrive/c/ti/msp430-gcc/bin
# configuration
MSPCC=${MSPBASE}/msp430-elf-gcc
MSPCCFLAGS=-Wall -mmcu=msp430c1111
MSPLDFLAGS=-mmcu=msp430c1111 -T linker.msp430.x
MSPAR=${MSPBASE}/msp430-elf-ar
MSPOBJCOPY=${MSPBASE}/msp430-elf-objcopy
MSPOBJDUMP=${MSPBASE}/msp430-elf-objdump
MSPSIZE=${MSPBASE}/msp430-elf-size

all: ${NAME}.elf ${NAME}.a43 ${NAME}.lst


${NAME}.o: main.c
	$(MSPCC)  $(MSPCCFLAGS) -c $< -o $@

${NAME}.elf: ${NAME}.o
	$(MSPCC) $(MSPLDFLAGS) $< -o $@
	$(MSPSIZE) $@

${NAME}.a43: ${NAME}.elf
	${MSPOBJCOPY} -O ihex $^ $@

${NAME}.lst: ${NAME}.elf
	${MSPOBJDUMP} -dSt $^ >$@

clean:
	rm -f ${NAME} ${NAME}.a43 ${NAME}.lst ${NAME}.elf *.o *~

