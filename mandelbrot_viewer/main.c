#include <stdio.h>
#include <time.h>
#define MANDELBROT_ITER 1000
#include "mandelbrot.h"
#include "render.h"
int main(void) {
  clock_t start = clock();
  struct Screen scr = MakeScreen(45,45);
  for (float y = 0; y < 45; y++) for (float x = 0; x < 45; x++) if (IsMandelbrot((x/(float)15-2)+(1.5-y/(float)15)*I)) SetScreenPx(&scr,x,y,'#');
  RenderScreen(&scr);
  DeleteScreen(&scr);
  printf("Rendered mandelbrot in %lf seconds with %d iterations on each point\n",(clock()-start)/(double)CLOCKS_PER_SEC,MANDELBROT_ITER);
  return 0;
}
