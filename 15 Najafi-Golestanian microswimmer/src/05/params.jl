#= ==========================================================================================
=============================================================================================
params
=============================================================================================
========================================================================================== =#

# space
xmax = 50 # mm
x = range(-xmax, stop = xmax, step = 0.1);

# fluid
# water viscosity ≡ μ = 0.890 mPa s, water density ≡ ρ = 1000 kg/m³ → water kinematic shear viscosity ≡ ν ≡ μ/ρ = 0.890 (mm)²/(s),
viscosity = 0.890 # (mm)²/(s)
isFluidCompressible = false;
walledDimensions = [1,2];

# particles
radii = [
    1.0, # mm
    1.0, # mm
    0.5, # mm
]
positions = [
    [0, 0.], # mm
    [-5, 0.], # mm
    [3, 0.], # mm
]
amplitudes = [
    0,
    2e-1, # mm
    1e-1, # mm
]
periods = [
    0,
    100, # s
    100, # s
]
phases = [
    0,
    0,
    π/2,
]
coupleTorques = false;
coupleForces = false;
scheme = :ladd;

# simulation
simulationTime = 1e3; # s
ticksBetweenSaves = 100 |> snapshots -> simulationTime / step(x) / snapshots |> round |> Int64; # (about) 100 snapshots are saved
