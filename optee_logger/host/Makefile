# CC      ?= $(CROSS_COMPILE)gcc
# LD      ?= $(CROSS_COMPILE)ld
# AR      ?= $(CROSS_COMPILE)ar
# NM      ?= $(CROSS_COMPILE)nm
# OBJCOPY ?= $(CROSS_COMPILE)objcopy
# OBJDUMP ?= $(CROSS_COMPILE)objdump
# READELF ?= $(CROSS_COMPILE)readelf

#OBJS = main.o

#CFLAGS += -Wall -I../ta/include -I$(TEEC_EXPORT)/include -I./include
#Add/link other required libraries here
#LDADD += -lteec -L$(TEEC_EXPORT)/lib

#BINARY = optee_example_hello_world

#.PHONY: all
#all: $(BINARY)

#$(BINARY): $(OBJS)
#	$(CC) $(LDFLAGS) -o $@ $< $(LDADD)

#.PHONY: clean
#clean:
#	rm -f $(OBJS) $(BINARY)

#%.o: %.c
#	$(CC) $(CFLAGS) -c $< -o $@
#


CC ?= $(CROSS_COMPILE)gcc

CFLAGS += -Wall -I../ta/include -I./include
CFLAGS += -I$(OPTEE_CLIENT_EXPORT)/include
CFLAGS += -fstack-protector-strong
LDADD += -lteec -L$(OPTEE_CLIENT_EXPORT)/lib

SRCS = main.c
OBJS = $(patsubst %.c,$(O)/%.o,$(SRCS))
BINARY = optee_example_hello_world

.PHONY: all install
all: $(BINARY) install

$(BINARY): $(OBJS)
	$(CC) -o $(O)/$@ $< $(LDADD)

$(O)/%.o: %.c
	mkdir -p $(O)
	$(CC) $(CFLAGS) -c $< -o $@

install: $(BINARY)
	mkdir -p $(OPTEE_CLIENT_EXPORT)/sbin
	cp $(O)/$(BINARY) $(OPTEE_CLIENT_EXPORT)/sbin

.PHONY: clean
clean:
	rm -f $(OBJS) $(O)/$(BINARY) $(OPTEE_CLIENT_EXPORT)/sbin/$(BINARY)
