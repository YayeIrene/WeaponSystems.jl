module WeaponSystems
using ExternalBallistics
# Write your package code here.
include("types.jl")
include("tank.jl")
include("transformations.jl")

export  TargetRect, TargetCirc, TargetSphe, Hull, Turret, Canon, Sight, Tank, targetPos, muzzlePos, muzzleVel, wind
end
