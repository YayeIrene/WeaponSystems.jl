module WeaponSystems
using ExternalBallistics
using ReferenceFrameRotations
using DataFrames, Distances
# Write your package code here.
include("types.jl")
include("tank.jl")
include("transformations.jl")
include("ballisticComputer.jl")

export  TargetRect, TargetCirc, TargetSphe, Hull, Turret, Canon, Sight, Tank, targetPos, muzzlePos, muzzleVel, wind,adjustedFire!,
Fuze
end
