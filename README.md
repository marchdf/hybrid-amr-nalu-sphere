# Hybrid Nalu-Wind and AMR-Wind DNS of a sphere


## notes on grid sizes:
### Rodriguez (2011): 

For Re = 3700

In the BL:
- 12 points in boundary layer, laminar BL is estimated with schlichting 1979
- this would suggest a laminar BL thickness of 5 * x / sqrt(Re) = 0.158 (if x = D)
- putting 12 points in there would mean an initial dx of around 0.013

Near wake (x/D < 3):
- Kolmogorov scale is eta/D = 0.0134
- eta/D is 0.0303 around x/D=4

Grid sizes used:
- h/D = 0.0015 behind sphere to x/D = 3
- h/D = 0.014 for 3 < x/D < 5

## Tomboulides (2000)
- Re 100 to 1000
- Table 1 has the BL thickness: for Re 1000, delta is 0.035
