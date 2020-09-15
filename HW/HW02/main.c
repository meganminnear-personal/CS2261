#include "myLib.h"

// variables
u16 buttons;
u16 oldButtons;
int paddleSize;
int paddleX, paddleY, prevPaddleX;

int padding;
int screenWidth;
int screenHeight;

// prototypes
void initialize();
void updateGame();

int main() {
    initialize();
    while(1) {
        updatePaddlePosition();

        waitForVBlank();
        drawRect(prevPaddleX, paddleY, paddleSize, 5, WHITE);
        drawRect(paddleX, paddleY, paddleSize, 5, PINK);
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
