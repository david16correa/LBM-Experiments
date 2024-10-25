#= ==========================================================================================
=============================================================================================
params
=============================================================================================
========================================================================================== =#

# space
xmax = 10 # mm
x = range(-xmax, stop = xmax, step = 0.1);
walledDimensions = [2]; # walls around $y$

# fluid
# water viscosity ≡ μ = 0.890 mPa s, water density ≡ ρ = 1000 kg/m³ → water kinematic shear viscosity ≡ ν ≡ μ/ρ = 0.890 (mm)²/(s),
viscosity = 0.890 # (mm)²/(s)
isFluidCompressible = false;

# wall
speed = 0.01;
h = 5;
solidNodes = [j > h || j < -h for i in x, j in x];
solidNodeVelocity = [j > h ? [speed, 0] : j < -h ? [speed, 0] : [0., 0] for i in x, j in x];

# simulation
simulationTime = 100; # s
ticksBetweenSaves = 100 |> snapshots -> simulationTime / step(x) / snapshots |> round |> Int64; # (about) 100 snapshots are saved
