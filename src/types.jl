
#abstract type AbstractTarget end
mutable struct Target1D 
    size::Float64
    position::Float64
end

"""
    TargetRect(a,b,position)
defines a rectangular target by specifying the lenght a, the height b and the position (range)
"""
mutable struct TargetRect <:AbstractTarget
    a::Float64
    b::Float64
    position::Union{Array{Float64,1},Nothing}
    ρ::Union{Float64,Nothing}
end

"""
    TargetCirc(ρ,position)
defines a circular target by specifying the radius ρ and the position (range)
"""
mutable struct TargetCirc <:AbstractTarget
    ρ::Float64 #radius
    position::Float64
end
"""
    TargetSphe(ρ,position)
defines a spherical target by specifying the radius ρ and the position (range)
"""
mutable struct TargetSphe <:AbstractTarget
    ρ::Float64 #radius
    position::Float64
end

mutable struct Fuze 
    offset::Float64
    height::Float64
end 
