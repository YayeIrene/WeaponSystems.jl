using WeaponSystems
using Documenter

#DocMeta.setdocmeta!(WeaponSystems, :DocTestSetup, :(using WeaponSystems); recursive=true)
push!(LOAD_PATH,"../src/")
makedocs(;
    modules=[WeaponSystems],
    #authors="Irene Ndindabahizi, Royal Millitary Academy, Belgium",
    #repo="https://github.com/YayeIrene/WeaponSystems.jl/blob/{commit}{path}#{line}",
    sitename="WeaponSystems.jl",
  #=  format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://YayeIrene.github.io/WeaponSystems.jl",
        assets=String[],
    ),=#
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/YayeIrene/WeaponSystems.jl.git",
)
