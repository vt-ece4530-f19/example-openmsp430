#include "omsp_system.h"

int main(void) {
  register unsigned int k = 1;

  P1DIR = 0xFF;              // initialize LED for output
  WDTCTL = WDTPW | WDTHOLD;  // Disable watchdog timer
  eint();

  while (1) {
    k = 0x1;
    do {
      P1OUT |= k;
      P1OUT &= ~k;
      k <<= 1;
    } while (k != 0x80);
  }

  dint();

  return 0;
}
