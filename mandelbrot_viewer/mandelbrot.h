#ifndef mandelbrot_h
#define mandelbrot_h
#ifndef MANDELBROT_ITER
#define MANDELBROT_ITER 200
#endif
#include <complex.h>
#undef complex
#define complex double _Complex
#define mandelbrot_formula(z,c) (cpow(z,2)+c)
int IsMandelbrot(complex c) {
  complex z = 0;
  unsigned long iter = MANDELBROT_ITER;
  for (unsigned long i = 0; i < iter; i++) {
    z = mandelbrot_formula(z,c);
    if (creal(z) > 2) return 0;
  }
  return 1;
}
#endif
