#include "myLib.h"
#include "kitty.h"

// variables
KITTY kitties[KITTYCOUNT];
u16 buttons;
u16 oldButtons;

// prototypes
void initialize();
void updateGame();
void reverseKitties();
void swap(KITTY*, KITTY*);
// TODO 3.1: add the function prototype for the swap method you wrote

int main() {
    // first, set up
    initialize();

    while(1) {
        // update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // mode 3 "workflow": updateGame, waitForVBlank, drawGame
        updateGame();
        waitForVBlank();
        for (int i = 0; i < KITTYCOUNT; i++) {
            drawKitty(&kitties[i], i);
        }
    }
}

// sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    initializeKitties();
}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        reverseKitties();
    }
}

void reverseKitties() {
    // TODO 3.2: implement this method, calling a helper method called swap; ensure you do an in-place array reversal
    int end = KITTYCOUNT - 1;
    for (int beg = 0; beg < KITTYCOUNT / 2; beg++) {
        swap(&kitties[beg], &kitties[end]);
        end--;
    }
}

// TODO 3.0: implement swap for two kitties
void swap(KITTY* kitty1, KITTY* kitty2) {
    KITTY temp = *kitty1;
    *kitty1 = *kitty2;
    *kitty2 = temp;
}

