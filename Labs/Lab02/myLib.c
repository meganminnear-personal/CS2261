#include "myLib.h"
#include <stdio.h>

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    // TODO #1: implement this function
    for (int x = col; x < (col + width); x++) {
        for (int y = row; y < (row + height); y++) {
            setPixel(x, y, color);
        }
    }


}

void fillScreen(unsigned short color) {
    // TODO #2: implement this function
    // note: you may only use a single loop
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }

}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    if ((colA < colB + widthB - 1) && !(colA + widthA - 1 < colB)) {
        if (rowA > rowB + heightB - 1) {
            return 0;
        }
        return 1;
    } else if ((colB < colA + widthA - 1) && !(colB + widthB - 1 < colA)) {
        if (rowA > rowB + heightB - 1) {
            return 0;
        }
        return 1;
    } else if ((rowB + heightB - 1 > rowA) && !(rowB > rowA + heightA - 1)) {
        if (colA > colB + widthB || colA + widthA < colB) {
            return 0;
        }
        return 1;
    } else if ((rowB > rowA + heightA - 1) && !(rowA > rowB + heightB - 1)) {
        if (colA > colB + widthB || colA + widthA < colB) {
            return 0;
        }
        return 1;
    }

    return 0;
}