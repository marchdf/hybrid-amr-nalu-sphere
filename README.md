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

## PW sphere mesh generation

Notes from A. Sharma:

1. Create -> Draw shape -> Sphere.
a. Select entity database and enter a desired radius, r1. This will be the wall surface.
2. Create -> Draw shape -> Sphere.
a. Select entity data base and enter a desired radius, r2. This will be the overset interface.
3. We will now create a uniform cube grid of dimensions smaller. Create -> Draw shape -> Box
a. Select entity grid and grid type as structured.
b. Make sure the dimensions of the cube are small enough to fit inside the sphere with radius r1, but not too small.
c. Translate the cube if you required (select all domains/connectors/blocks + copy/paste + translate), and adjust the number of cells (select all connectors and redimension) in the cube. This is going to determine your mesh size at the wall.
d. Delete the block, but keep the domains.
4. We will now project the cube from 3 onto the sphere from 1. Edit -> project.
a. Select type as closest point.
b. Unselect interior only and select project points.
c. Select target database selection , and select the database from 1.
d. Project.
e. At this point we observe that the aspect ratios are a bit too intense in the regions where the corners were projected. So now we select all 6 domains, and select Grid -> Solve. Click on Initialize then Run for enough number of times until the grid stops adjusting the cell shapes. You will now notice the aspect ratios are better. I haven't played with a whole lot of settings here. Usually the defaults have worked out for me in the past.
5. We will now extrude this spherical surface to create the blocks. Create -> extrude -> normal
a. Click on Done
b. Under Attributes, flip orientation if needed to ensure normals are pointing outwards.
c. Under Attributes, select extrusion method as Algebraic.
d. Under Attributes, for the step size, the initial delta s and growth rate determine how the mesh size grows from the wall to the overset interface.
e. Under Run, click on Run1 enough number of times until the extrusion has reached about where the 2nd database is.
f. After clicking ok, you should have 2 blocks. You can now set your boundary/volume conditions.
