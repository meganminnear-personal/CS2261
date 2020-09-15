# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 43 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 68 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 78 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2


u16 buttons;
u16 oldButtons;
int paddleSize;
int paddleX, paddleY, prevPaddleX;

int padding;
int screenWidth;
int screenHeight;


void initialize();
void updateGame();

int main() {
    initialize();
    while(1) {
        updatePaddlePosition();

        waitForVBlank();
        drawRect(prevPaddleX, paddleY, paddleSize, 5, ((31) | (31)<<5 | (31)<<10));
        drawRect(paddleX, paddleY, paddleSize, 5, ((31) | (23)<<5 | (23)<<10));
    }

}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    fillScreen(((31) | (31)<<5 | (31)<<10));

    padding = 3;
    screenWidth = 240 - 2*padding;
    screenHeight = 160 - 2*padding;
    paddleSize = (239 - 2*padding) / 4;



    paddleX = ((screenWidth - paddleSize) / 2 + padding);
    paddleY = (screenHeight + padding - 1) - 5;
    prevPaddleX = paddleX;
}

void updateGame() {

}

void updatePaddlePosition() {
    int paddleSpeed = 1;
    prevPaddleX = paddleX;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        paddleX -= paddleSpeed;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        paddleX += paddleSpeed;
    }


    if (paddleX <= padding) {
        paddleX = padding + 1;
    }
    if (paddleX + paddleSize >= (239 - padding)) {
        paddleX = 239 - paddleSize - padding;
    }

}
