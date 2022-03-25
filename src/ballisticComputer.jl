"""
    adjustedFire(t, proj, weapon, aero,tank)

Adjsut the elevation and azimuth angle to hit the target within a precision of 1 mm. The function returns the adjusted
elevation and azimuth angles in degrees.
"""
function adjustedFire!(t::AbstractTarget, proj::AbstractPenetrator, weapon::Gun, aero::DataFrame,tank::Tank;w=Wind(0.0, 0.0),atmosphere=nothing)
    precision=0.001
    missDist = 1e3
    QE = 0.0
    AZ = 0.0
    windIn = wind(tank, w)
    while missDist >precision 
       # println("Find QE AZ")       
    QE,AZ=QEfinderMPMM(t, proj, weapon,aero,w_bar=windIn,atm=atmosphere)
    #println("QE", " ", QE)
    #println("AZ", " ", AZ)
    if isnan(QE)
        println("NaN")
        break 
    end 
    weapon.QE = QE#rad2deg(QE)
    weapon.AZ = AZ#rad2deg(AZ)
    tank.canon.θ = QE#rad2deg(QE)
    tank.turret.ξ = AZ#rad2deg(AZ)
    windIn = wind(tank, w)
    proj.position=muzzlePos(tank)
    proj.velocity=muzzleVel(tank)
    #println("compute impact point")
    impactP= trajectoryMPMM(proj, t, weapon,aero,w_bar=windIn,atm=atmosphere)[1]
    #println("computed", " ", impactP)
    missDist = euclidean(impactP,t.position)
    #println("miss distance", " ", missDist)
    end 
    return QE,AZ
    
end 