#ifndef render_h
#define render_h
#include <stdio.h>
#include <stdlib.h>
struct Screen {
  char* pxarr;
  unsigned short width, height;
};
struct Screen MakeScreen(unsigned short width, unsigned short height) {
  struct Screen scr;
  scr.width = width;
  scr.height = height;
  scr.pxarr = calloc(width*height,1);
  return scr;
}
void DeleteScreen(struct Screen* scr) {
  free(scr->pxarr);
}
void SetScreenPx(struct Screen* scr,unsigned short x,unsigned short y,char c) {
  if (scr->height < y || scr->width < x) {
    printf("X/Y is larger than the width/height of the screen\n");
    return;
  }
  scr->pxarr[y*scr->width + x] = c;
}
void RenderScreen(struct Screen* scr) {
  for (unsigned short y = 0; y < scr->height; y++) {
    for (unsigned short x = 0; x < scr->width; x++) {
      char c = scr->pxarr[y*scr->width + x];
      if (!c) c = '.';
      printf("%c ",c);
    }
    printf("\n");
  }
}
#endif
