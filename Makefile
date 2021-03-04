FF_PATH = /home/kshyeon/nfs/ks1060c/
CC = /usr/arm-palmcheck/ks1060c/bin/arm-linux-gnueabi-gcc
CFLAGS = -I$(FF_PATH)/include -Wall -O2
LDFLAGS = -L$(FF_PATH)/lib -lavutil -lavformat -lavcodec -lavutil \
		-lswscale -lswresample -lz -lm -lpthread

all: fbff
.c.o:
	$(CC) -c $(CFLAGS) $<
fbff: fbff.o ffs.o draw.o
	$(CC) -o $@ $^ $(LDFLAGS)
	cp $@ /home/kshyeon/nfs/ks1060c/bin

clean:
	rm -f *.o fbff
