### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 07092300-c92c-11ee-35aa-a942ccd5fc34
begin
    import Pkg
    # activate a temporary environment
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(name="Makie", version="0.12.0"),
        Pkg.PackageSpec(name="GLMakie", version="0.1.25"),
        Pkg.PackageSpec(name="CairoMakie", version="0.3.12"),
        Pkg.PackageSpec(name="GLM", version="1.3.11"),
        Pkg.PackageSpec(name="KernelDensity", version="0.6.2"),
		Pkg.PackageSpec(name="PlutoUI"),
		Pkg.PackageSpec(name="Plots", version="1.10.4"),
		Pkg.PackageSpec(name="StatsBase", version="0.33.2"),
		Pkg.PackageSpec(name="StatsPlots", version="0.14.19"),
		Pkg.PackageSpec(name="TypedTables", version="1.2.3"),
		Pkg.PackageSpec(name="JuMP", version="0.21.5"),
		Pkg.PackageSpec(name="Ipopt"),
		Pkg.PackageSpec(name="GLPK"),
    ])
    using PlutoUI, VegaLite, Makie, StatsBase, StatsPlots, TypedTables, GLMakie, CairoMakie, GLM, KernelDensity, JuMP, Ipopt, Plots; plotly(size=(800,450))
end

# ╔═╡ bc108b6c-2f00-486a-8984-81a97b6d4340


# ╔═╡ Cell order:
# ╠═07092300-c92c-11ee-35aa-a942ccd5fc34
# ╠═bc108b6c-2f00-486a-8984-81a97b6d4340
