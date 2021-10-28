# mandelbrot.jl

Simple multi-threaded script to calculate the mandelbrot set.

To launch with a specific number of threads use: `julia --threads x mandelbrot.jl`

## Changing the resolution

To change the resolution change the `mandelbrotSize` variable.

```
VALUE     SIZE                 NUMBER OF POINTS
1.0     : (80, 41)           : 3,280
0.1     : (794, 401)         : 318,394
0.01    : (7937, 4001)       : 31,755,937
0.001   : (79366, 40001)     : 3,174,719,366
0.0001  : (793651, 400001)   : 317,461,193,651
0.00001 : (7936508, 4000001) : 31,746,040,000,000
```
