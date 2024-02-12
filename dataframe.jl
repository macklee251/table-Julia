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
		Pkg.PackageSpec(name="StatsBase", version="0.33.2"),		Pkg.PackageSpec(name="TypedTables", version="1.2.3"),
		Pkg.PackageSpec(name="JuMP", version="0.21.5"),
		Pkg.PackageSpec(name="Ipopt"),
		Pkg.PackageSpec(name="GLPK"),
    ])
    using PlutoUI, Makie, StatsBase, TypedTables, GLM, KernelDensity
end

# ╔═╡ bc108b6c-2f00-486a-8984-81a97b6d4340
md"""
## A table is a unique Julia DataType. It is basically a matrix with identifiers for columns headers and rows.
"""

# ╔═╡ 73d27ae0-0119-4059-b856-96cbf790245c
md"""
### There are several ways to create a table but many of them require adding a larger package like DataFrames. But once that we want to use a small package to convert data into a table. We can use the Table function from the TypedTables package
"""

# ╔═╡ fe4d0ff4-4ad4-4ac7-9a91-f0425ec8dcd1
begin
	t = collect(1:20)
	observations = [144, 151, 157, 170, 152, 145, 175, 149, 99, 113, 140, 102, 135, 149, 149, 68, 136, 144, 72, 97]
end

# ╔═╡ 8431cd84-0f53-4489-9305-37c089fe79d4
data = Table(X = t, Y = observations)

# ╔═╡ a9e374d3-8e04-41f0-b821-ad3786d9eeca
typeof(data)

# ╔═╡ c7af9933-b974-4aea-9aa2-87bd28c808de
md"""
### Agora que os dados foram convertidos para uma tabela, podemos usar o GLM para calcular uma regressão linear
"""

# ╔═╡ 6e454d55-db2b-4395-9f9d-609d9dc8264c
ols = lm(@formula(Y ~ X), data)

# ╔═╡ 14d77651-06e7-40f2-9208-9e544d1b83aa
md"""
$$y = ax+b$$
"""

# ╔═╡ 859bf3fe-af12-4d3a-879c-78cb049e0e1c
md"""
$$y = -2.99023 x + 163.747$$
"""

# ╔═╡ 1deb1474-79f4-4b10-940e-6b49779b41d4
	p_scatter =  plot(t, observations,
						 xlabel = "Time",
						 ylabel = "Observations",
						 title = "Plots/GR Linear Regression",
						 legend = false,
						 color = :dodgerblue,
						 alpha = 0.5
)
	

# ╔═╡ e3bc22ec-ca44-4bf6-89fc-21b19789a3d8
r² = r2(ols)

# ╔═╡ d03540aa-d7c2-4a3f-a54c-50ae3861623f
md"""
### Fazendo um predição encima dos valores que fornecemos
"""

# ╔═╡ 7720f910-234d-426a-bfd8-cd53b3d2fa8a
predict(ols)

# ╔═╡ 25b30b1b-7e4a-4b4d-b2a2-295754b9c904
md"""
### Fazendo uma prediçãao com novos valores. Prevendo os valores de y para valores de x dados
"""

# ╔═╡ 9ad73061-4082-4883-96bb-570a6d91f307
newX = Table(X = [5.5, 10.7, 12.3])


# ╔═╡ 9b75079e-14c3-4f62-af6f-14755ed7dec1
predict(ols, newX)

# ╔═╡ Cell order:
# ╠═07092300-c92c-11ee-35aa-a942ccd5fc34
# ╟─bc108b6c-2f00-486a-8984-81a97b6d4340
# ╟─73d27ae0-0119-4059-b856-96cbf790245c
# ╠═fe4d0ff4-4ad4-4ac7-9a91-f0425ec8dcd1
# ╠═8431cd84-0f53-4489-9305-37c089fe79d4
# ╠═a9e374d3-8e04-41f0-b821-ad3786d9eeca
# ╟─c7af9933-b974-4aea-9aa2-87bd28c808de
# ╠═6e454d55-db2b-4395-9f9d-609d9dc8264c
# ╟─14d77651-06e7-40f2-9208-9e544d1b83aa
# ╟─859bf3fe-af12-4d3a-879c-78cb049e0e1c
# ╠═1deb1474-79f4-4b10-940e-6b49779b41d4
# ╠═e3bc22ec-ca44-4bf6-89fc-21b19789a3d8
# ╟─d03540aa-d7c2-4a3f-a54c-50ae3861623f
# ╠═7720f910-234d-426a-bfd8-cd53b3d2fa8a
# ╟─25b30b1b-7e4a-4b4d-b2a2-295754b9c904
# ╟─9ad73061-4082-4883-96bb-570a6d91f307
# ╠═9b75079e-14c3-4f62-af6f-14755ed7dec1
