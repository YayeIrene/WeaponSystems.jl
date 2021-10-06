
#abstract type AbstractTarget end
mutable struct Target1D 
    size::Float64
    position::Float64
end

"""
    TargetRect(a,b,position)
defines a rectangular target by specifying the lenght a, the height b and the position (range)
"""
mutable struct TargetRect 
    a::Float64
    b::Float64
    position::Float64
end

"""
    TargetCirc(ρ,position)
defines a circular target by specifying the radius ρ and the position (range)
"""
mutable struct TargetCirc 
    ρ::Float64 #radius
    position::Float64
end

mutable struct TargetSphe
    ρ::Float64 #diameter
    position::Float64
end 
