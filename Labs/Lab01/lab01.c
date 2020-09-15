// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawLetter(int, int);
void drawRect(int, int);

// Global Variables
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    //TODO 1.1: Test your setPixel function
    setPixel(10, 20, RED);
    
    //TODO 2.1: Call your drawRect function once
    drawRect(50, 50);

    //TODO 3.1: Call your drawLetter function twice
    drawLetter(100, 100);
    drawLetter(150, 80);
    
    while(1);
}


void setPixel(int col, int row, unsigned short color) {

    // TODO 1: Complete this function
    videoBuffer[OFFSET(row, col, 240)] = color;
}

void drawRect(int col, int row) {

    // TODO 2: Complete this function


    // draws horizontal parallel lines
    for (int i = 0; i < 40; i++) {
        setPixel(row, col + i, CYAN);
        setPixel(row + 50, col + i, CYAN);
    }

    // draws vertical parallel lines
    for (int x = 0; x <= 50; x++) {
        setPixel(row + x, col, CYAN);
        setPixel(row + x, col + 40, CYAN);
    }

}

void drawLetter(int col, int row) {

    // TODO 3: Complete this function

    // Stems of M
    for (int z = 0; z <= 30; z++) {
        setPixel(row + z, col, YELLOW);
        setPixel(row + z, col + 30, YELLOW);
    }

    // Downward diagnoal of M
    // going down
    int x = 0;
    // going right
    int y= 0;

    // going down diagonal
    while (x < 15) {
        setPixel(row + y, col + x, YELLOW);
        x++;
        y++;
    }

    // going up diagnoal
    while (x < 30) {
        setPixel(row + y, col + x, YELLOW);
        x++;
        y--;
    }

}


