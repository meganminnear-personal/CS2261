#include <stdio.h>
#include "myLib.c"

// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

//set pixel macro
#define SETPIXEL(col, row, color) (videoBuffer[OFFSET(row, col, 240)] = color)

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)
#define SKY COLOR(10, 15, 20)
#define GROUND COLOR(10, 20, 10)

// Function Prototypes
//void drawFlagNeutral(int col, int row, unsigned short color);

// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    setBackground();
    drawTent();

    while(1) {
        waitForVBLANK();
        
    }
}


void setBackground() {
    for (int row = 0; row < 120; row++) {
        for (int col = 0; col < 240; col++) {
            SETPIXEL(row, col, SKY);
        }
    }

    for (int row2 = 120; row2 < 159; row2++) {
        for(int col2 = 0; col2 < 240; col2++) {
            SETPIXEL(row2, col2, GROUND);
        }
    }
}

void drawTent() {
    for (int row = 80; row < 120; row++) {
        for (int col = 60; col < 180; col++) {
            SETPIXEL(row, col, WHITE);
        }
    }

    // sloped tent
    //for (int col = 70; col < 170; col++) {
    //}
    drawThickLine(70, 70, 100, WHITE);
    drawThickLine(60, 80, 80, WHITE);
    drawThickLine(50, 90, 60, WHITE);
    drawThickLine(40, 100, 40, WHITE);

    drawFlagPole(40, 120);
    drawFlagPole(80, 61);
    drawFlagPole(80, 178);

    drawFlagNeutral(120, 20, RED);
    drawFlagNeutral(61, 60, BLUE);
    drawFlagNeutral(178, 60, WHITE);
}


void drawThickLine(int row, int col, int length, unsigned short color) {
    int rowInit = row;
    int colInit = col;
    while (row < (rowInit + 10)) { //70 < 74
        while (col < (colInit + length)) { //60 < 170
            SETPIXEL(row, col, color);
            col++;
        }
        row++;
        col = colInit;
    }

}

void drawFlagPole(int row, int col) {
    for (int x = (row - 20); x < row; x++) {
        SETPIXEL(x, col, BLACK);
        SETPIXEL(x, col - 1, BLACK);
        SETPIXEL(x, col + 1, BLACK);
    }
}

void drawFlagNeutral(int col, int row, unsigned short color) {
    for (int y = row; y < (row + 9); y++) {
        SETPIXEL(y, col, color);
        SETPIXEL(y, (col + 1) , color);
    }
    col += 2;
    for (int y = (row + 1); y < (row + 8); y++) {
        SETPIXEL(y, col, color);
        SETPIXEL(y, (col + 1), color);
    }
    col += 2;
    for (int y = (row + 2); y < (row + 7); y++) {
        SETPIXEL(y, col, color);
        SETPIXEL(y, (col + 1), color);
    }
    col += 2;
    for (int y = (row + 3); y < (row + 6); y++) {
        SETPIXEL(y, col, color);
        SETPIXEL(y, (col + 1), color);
    }
    col += 2;
    for (int y = (row + 4); y < (row + 5); y++) {
        SETPIXEL(y, col, color);
        SETPIXEL(y, (col + 1), color);
    }

}

