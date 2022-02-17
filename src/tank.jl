"""
    The Hull is defined by :
    * Φ: angle of rotation of the tank around the longitudinal axis. If the right side of the tank is lower than the left side,
    than this angle is positif.
    * Ψ: angle defined by the longitudinal axes of the tank and the horizontal plane
    If the nose of the tank is higher than the back, this angle is positif
    * Χ: angle defined by the the projection of the longitudinal axis of the tank into an horizontal plane
    and the X axis
"""
mutable struct Hull
    Φ::Union{Float64,Nothing}
    ψ::Union{Float64,Nothing}
    χ::Union{Float64,Nothing}
end
"""
    The turret is defined by its azimuth angle
"""
mutable struct Turret
     ξ::Union{Float64,Nothing}#azimuth
end
"""
    The Canon is defined by:
    * θ elevation angle (degrees)
    * lw the length of the canon
    * u₀ the muzzle velocity magnitude
"""
mutable struct Canon
     θ::Union{Float64,Nothing} #elevation
     lw::Float64
     u₀::Float64
     twist::Float64
end
"""
    The sight is defined by:
    * θ LOS elevation angle
    * ξ LOS azimuth angle 
"""
mutable struct Sight
    θ::Float64
    ξ::Float64
end
"""
    The tank is defined by: a hull, a turret, a canon, a sight and its position (altitude)
"""
mutable struct Tank
   hull::Hull
   turret::Turret
   canon::Canon
   sight::Sight
   rWY::Float64
   latitude::Float64
end