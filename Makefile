CC = gcc
CFLAGS = -Wall -W -Werror -g -O2
LDFLAGS = -libverbs
TARGETS = RDMA_RC_Example

all: $(TARGETS)

RDMA_RC_Example: RDMA_RC_Example.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)	

RDMA_RC_Example.o: RDMA_RC_Example.c
	$(CC) -c $(CFLAGS) $<

clean:
	\rm -f *.o $(TARGETS)
