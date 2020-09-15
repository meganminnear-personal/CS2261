# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 28 "lab01.c"
void setPixel(int, int, unsigned short);
void setBackground();
void drawTent();
void drawThickLine(int row, int col, int length, unsigned short color);
void drawFlagPole(int row, int col);
void drawFlagNeutral(int col, int row, unsigned short color);
void drawFlagUp(int col, int row, unsigned short color);
void drawFlagDown(int col, int row, unsigned short color);



volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;


int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);

    setBackground();
    drawTent();

    int counter = 0;
    int skipFrames = 3;
    int time = 0;

    while(1) {
        waitForVBlank();
        if (time % skipFrames == 0) {
            updateFlag(counter);

            if (counter == 3) {
                counter = 0;
            } else {
                counter++;
            }
        }
        time++;
    }
}

void updateFlag(int counter) {
    if (counter == 0) {

        drawFlagNeutral(122, 20, ((10) | (15)<<5 | (20)<<10));
        drawFlagNeutral(63, 60, ((10) | (15)<<5 | (20)<<10));
        drawFlagNeutral(180, 60, ((10) | (15)<<5 | (20)<<10));


        drawFlagDown(122, 20, ((31) | (0)<<5 | (0)<<10));
        drawFlagDown(63, 60, ((0) | (0)<<5 | (31)<<10));
        drawFlagDown(180, 60, ((31) | (31)<<5 | (31)<<10));
    } else if (counter == 1) {

        drawFlagDown(122, 20, ((10) | (15)<<5 | (20)<<10));
        drawFlagDown(63, 60, ((10) | (15)<<5 | (20)<<10));
        drawFlagDown(180, 60, ((10) | (15)<<5 | (20)<<10));


        drawFlagNeutral(122, 20, ((31) | (0)<<5 | (0)<<10));
        drawFlagNeutral(63, 60, ((0) | (0)<<5 | (31)<<10));
        drawFlagNeutral(180, 60, ((31) | (31)<<5 | (31)<<10));
    } else if (counter == 2) {

        drawFlagNeutral(122, 20, ((10) | (15)<<5 | (20)<<10));
        drawFlagNeutral(63, 60, ((10) | (15)<<5 | (20)<<10));
        drawFlagNeutral(180, 60, ((10) | (15)<<5 | (20)<<10));


        drawFlagUp(122, 20, ((31) | (0)<<5 | (0)<<10));
        drawFlagUp(63, 60, ((0) | (0)<<5 | (31)<<10));
        drawFlagUp(180, 60, ((31) | (31)<<5 | (31)<<10));

    } else {

        drawFlagUp(122, 20, ((10) | (15)<<5 | (20)<<10));
        drawFlagUp(63, 60, ((10) | (15)<<5 | (20)<<10));
        drawFlagUp(180, 60, ((10) | (15)<<5 | (20)<<10));

        drawFlagNeutral(122, 20, ((31) | (0)<<5 | (0)<<10));
        drawFlagNeutral(63, 60, ((0) | (0)<<5 | (31)<<10));
        drawFlagNeutral(180, 60, ((31) | (31)<<5 | (31)<<10));
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

void setBackground() {
    for (int row = 0; row < 120; row++) {
        for (int col = 0; col < 240; col++) {
            (videoBuffer[((row)*(240)+(col))] = ((10) | (15)<<5 | (20)<<10));
        }
    }

    for (int row2 = 120; row2 < 159; row2++) {
        for(int col2 = 0; col2 < 240; col2++) {
            (videoBuffer[((row2)*(240)+(col2))] = ((10) | (20)<<5 | (10)<<10));
        }
    }
}

void drawTent() {
    for (int row = 80; row < 120; row++) {
        for (int col = 60; col < 180; col++) {
            (videoBuffer[((row)*(240)+(col))] = ((31) | (31)<<5 | (31)<<10));
        }
    }




    drawThickLine(70, 70, 100, ((31) | (31)<<5 | (31)<<10));
    drawThickLine(60, 80, 80, ((31) | (31)<<5 | (31)<<10));
    drawThickLine(50, 90, 60, ((31) | (31)<<5 | (31)<<10));
    drawThickLine(40, 100, 40, ((31) | (31)<<5 | (31)<<10));

    drawFlagPole(40, 120);
    drawFlagPole(80, 61);
    drawFlagPole(80, 178);

    drawFlagNeutral(122, 20, ((31) | (0)<<5 | (0)<<10));
    drawFlagNeutral(63, 60, ((0) | (0)<<5 | (31)<<10));
    drawFlagNeutral(180, 60, ((31) | (31)<<5 | (31)<<10));
}


void drawThickLine(int row, int col, int length, unsigned short color) {
    int rowInit = row;
    int colInit = col;
    while (row < (rowInit + 10)) {
        while (col < (colInit + length)) {
            (videoBuffer[((row)*(240)+(col))] = color);
            col++;
        }
        row++;
        col = colInit;
    }

}

void drawFlagPole(int row, int col) {
    for (int x = (row - 20); x < row; x++) {
        (videoBuffer[((x)*(240)+(col))] = 0);
        (videoBuffer[((x)*(240)+(col - 1))] = 0);
        (videoBuffer[((x)*(240)+(col + 1))] = 0);
    }
}

void drawFlagNeutral(int col, int row, unsigned short color) {
    for (int y = row; y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 1); y < (row + 8); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 2); y < (row + 7); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 3); y < (row + 6); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 4); y < (row + 5); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }

}

void drawFlagUp(int col, int row, unsigned short color) {
    for (int y = row; y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 8); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 7); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 6); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 5); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 4); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 3); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = row; y < (row + 2); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
}

void drawFlagDown(int col, int row, unsigned short color) {
    for (int y = (row + 1); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 2); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 3); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 4); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 5); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 6); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 7); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
    col += 2;
    for (int y = (row + 8); y < (row + 9); y++) {
        (videoBuffer[((y)*(240)+(col))] = color);
        (videoBuffer[((y)*(240)+((col + 1)))] = color);
    }
}
