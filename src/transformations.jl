
"""
    targetPos(target,tank)

Is a function that returns the coordinates of the target in a coordinate system which has the origin on the tank at the base of the the canon
"""
function targetPos(target::AbstractTarget, tank::Tank)
    rdoelprimprim = [target.ρ; 0; 0]
    Rhull = angle_to_dcm(-deg2rad(tank.hull.Φ), -deg2rad(tank.hull.ψ), deg2rad(tank.hull.χ), :XZY)
    RLos = angle_to_dcm(0, -deg2rad(tank.sight.θ), deg2rad(tank.sight.ξ), :XZY)
    rdoelprim = Rhull*RLos*rdoelprimprim
    rdoel = rdoelprim + [0; tank.rWY; 0]
    return rdoel
    end
"""
    muzzlePos(tank)

Returns the coordinates of the muzzle exit in a coordinate system which has the origin on the tank at the base of the the canon
"""    
function muzzlePos(tank::Tank)
    rprimprim = [tank.canon.lw; 0; 0]
    Rhull = angle_to_dcm(-deg2rad(tank.hull.Φ), -deg2rad(tank.hull.ψ), deg2rad(tank.hull.χ), :XZY)
    Rloop = angle_to_dcm(0, -deg2rad(tank.canon.θ), 0, :XZY)
    Rtoren = angle_to_dcm(0, 0, deg2rad(tank.turret.ξ), :XZY)
    rprim = Rhull*Rtoren*Rloop*rprimprim
    r = rprim +[0; tank.rWY; 0]
    return r
    end
"""
    muzzleVel(tank)

Returns the muzzle velocity vector in a coordinate system which has the origin on the tank at the base of the the canon
"""
    
    function muzzleVel(tank::Tank)
    uprimprim = [tank.canon.u₀; 0; 0]
    Rhull = angle_to_dcm(-deg2rad(tank.hull.Φ), -deg2rad(tank.hull.ψ), deg2rad(tank.hull.χ), :XZY)
    Rloop = angle_to_dcm(0, -deg2rad(tank.canon.θ), 0, :XZY)
    Rtoren = angle_to_dcm(0, 0, deg2rad(tank.turret.ξ), :XZY)
    uprim = Rhull*Rtoren*Rloop*uprimprim
    u =uprim
    return u
    end

"""
    wind(tank,w)

Returns the wind (w) vector in a coordinate system which has the origin on the tank at the base of the the canon
"""
    
    function wind(tank::Tank, w::Wind)
        w = [-w.cross*sind(tank.turret.ξ+tank.hull.χ)-w.range*cosd(tank.turret.ξ+tank.hull.χ);0.0;w.cross*cosd(tank.turret.ξ+tank.hull.χ)-w.range*sind(tank.turret.ξ+tank.hull.χ)]
    end
    