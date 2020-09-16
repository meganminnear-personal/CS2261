# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 45 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 70 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 80 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2


u16 buttons;
u16 oldButtons;
int paddleSize;
int paddleX, paddleY, prevPaddleX;

int padding;
int screenWidth;
int screenHeight;

u16 rectType = ((17) | (16)<<5 | (15)<<10);;
int rectX, rectY, prevRectY;


enum State {LOSE, WIN, GAME};
int state;



void initialize();
void updateGame();
void updatePaddlePosition();
void drawGoodRect();
void checkRects();

int main() {
    initialize();
    while(1) {

        checkRects();
        updatePaddlePosition();

        updateRectPosition();

        waitForVBlank();
        drawRect(prevPaddleX, paddleY, paddleSize, 5, ((31) | (31)<<5 | (31)<<10));
        drawRect(paddleX, paddleY, paddleSize, 5, ((31) | (23)<<5 | (23)<<10));
        drawRect(rectX, prevRectY, 20, 30, ((31) | (31)<<5 | (31)<<10));
        drawRect(rectX, rectY, 20, 30, rectType);
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

void checkRects() {
    if (rectY == (screenHeight + padding)) {

            int goodbad = rand() % 2;

            drawRect(rectX, rectY, 20, 30, ((31) | (31)<<5 | (31)<<10));

            if (goodbad == 0) {
                drawGoodRect();
            } else {
                drawBadRect();
            }
    }
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

void updateRectPosition() {
    prevRectY = rectY;
    rectY++;
}

void drawGoodRect() {
    rectX = rand() % screenWidth;
    if (rectX >= 210) {
        rectX = 210 - padding;
    } else if (rectX == 0) {
        rectX = padding;
    }
    rectY = padding;
    prevRectY = rectY;
    rectType = ((31) | (29)<<5 | (17)<<10);;
    drawRect(rectX, rectY, 20, 30, rectType);
}

void drawBadRect() {
    rectX = (rand() % screenWidth);
    if (rectX >= 210) {
        rectX = 210 - padding;
    } else if (rectX == 0) {
        rectX = padding;
    }
    rectY = padding;
    prevRectY = rectY;
    rectType = ((17) | (16)<<5 | (15)<<10);;
    drawRect(rectX, rectY, 20, 30, rectType);
}
