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

mutable struct Canon
     θ::Union{Float64,Nothing} #elevation
     lw::Float64
     u₀::Float64
end

mutable struct Sight
    θ::Float64
    ξ::Float64
end

mutable struct Tank
   hull::Hull
   turret::Turret
   canon::Canon
   sight::Sight
   rWY::Float64
end