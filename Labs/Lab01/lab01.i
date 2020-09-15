# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawLetter(int, int);
void drawRect(int, int);


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);


    setPixel(10, 20, ((31) | (0)<<5 | (0)<<10));


    drawRect(50, 50);


    drawLetter(100, 100);
    drawLetter(150, 80);

    while(1);
}


void setPixel(int col, int row, unsigned short color) {


    videoBuffer[((col)*(240)+(row))] = color;
}

void drawRect(int col, int row) {




    if(col < 200 && row < 110) {

        for (int i = 0; i < 40; i++) {
            setPixel(row, col + i, ((0) | (31)<<5 | (31)<<10));
            setPixel(row + 50, col + i, ((0) | (31)<<5 | (31)<<10));
        }


        for (int x = 0; x <= 50; x++) {
         setPixel(row + x, col, ((0) | (31)<<5 | (31)<<10));
         setPixel(row + x, col + 40, ((0) | (31)<<5 | (31)<<10));
        }
    }

}

void drawLetter(int col, int row) {



    if (row < 240 && col < 160) {


        for (int z = 0; z <= 30; z++) {
            setPixel(row + z, col, ((31) | (31)<<5 | (0)<<10));
            setPixel(row + z, col + 30, ((31) | (31)<<5 | (0)<<10));
        }



        int x = 0;

        int y= 0;


        while (x < 15) {
            setPixel(row + y, col + x, ((31) | (31)<<5 | (0)<<10));
            x++;
            y++;
        }


        while (x < 30) {
            setPixel(row + y, col + x, ((31) | (31)<<5 | (0)<<10));
            x++;
            y--;
        }
    }

}
