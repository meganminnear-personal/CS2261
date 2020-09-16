#include "myLib.h"

// variables
u16 buttons;
u16 oldButtons;
int paddleSize;
int paddleX, paddleY, prevPaddleX;

int padding;
int screenWidth;
int screenHeight;

int rectType = 0;
u16 rectColor = MIDGREY;
int rectX, rectY, prevRectY;

// state machines
enum State {LOSE, WIN, GAME};
int state;

int goodCount;
int badCount;


// prototypes
void initialize();
void updateGame();
void updatePaddlePosition();
void drawGoodRect();
void checkRects();

int main() {
    initialize();
    while(1) {
        // checks whether should update with new good or bad rect
        checkRects();
        updatePaddlePosition();
        // updates falling rectangle Y by 1 pixels
        updateRectPosition();

        waitForVBlank();
        drawRect(prevPaddleX, paddleY, paddleSize, 5, WHITE);
        drawRect(paddleX, paddleY, paddleSize, 5, PINK);
        drawRect(rectX, prevRectY, 20, 30, WHITE);
        drawRect(rectX, rectY, 20, 30, rectColor);

        if (collision(rectX, rectY, 20, 30, paddleX, paddleY, paddleSize, 5)) {
            if (rectType == 0) {
                goodCount++;
            } else {
                badCount++;
            }
            drawRect(rectX, rectY, 20, 30, WHITE);
            rectY = screenHeight + padding;
        }
    }

}

// sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    fillScreen(WHITE);

    padding = 3;
    screenWidth = 240 - 2*padding;
    screenHeight = 160 - 2*padding;
    paddleSize = (239 - 2*padding) / 4;

    //drawRect(105, 140, 30, 10, PINK);
    // trying to put in middle of screen (accounting for padding too)
    paddleX = ((screenWidth - paddleSize) / 2 + padding);
    paddleY = (screenHeight + padding - 1) - 5;
    prevPaddleX = paddleX;
}

void updateGame() {

}

void checkRects() {
    if (rectY == (screenHeight + padding)) {
            // uses 0 or 1 to decide rectangle type
            int goodbad = rand() % 2;
            // erase old rect
            drawRect(rectX, rectY, 20, 30, WHITE);
            // initialize good or bad rect
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
    if (BUTTON_HELD(BUTTON_LEFT)) {
        paddleX -= paddleSpeed;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        paddleX += paddleSpeed;
    }

    // keep paddle in bounds of padding
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
    rectColor = GOLD;
    drawRect(rectX, rectY, 20, 30, rectColor);
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
    rectColor = MIDGREY;
    drawRect(rectX, rectY, 20, 30, rectColor);
}