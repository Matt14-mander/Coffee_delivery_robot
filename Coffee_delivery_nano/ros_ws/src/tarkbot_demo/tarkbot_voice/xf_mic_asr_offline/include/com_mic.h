#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <cjson/cJSON.h>
#include <pthread.h>

#define FRAME_HEADER      0XA5
#define USER_ID      0X01

int set_opt(int,int,int,unsigned char,int);
int open_port(char*);
int deal_with(unsigned char);
short data_trans(unsigned char, unsigned char);
unsigned char check_sum(int);
