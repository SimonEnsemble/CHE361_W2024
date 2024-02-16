### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ 8262d07a-8bab-11ec-31db-411afb7cd7b0
begin
	import Pkg; Pkg.activate()
	using Controlz, PlutoUI, Polynomials, CairoMakie
end

# ╔═╡ ed800089-6d69-4ec2-af09-242d2c396ff0
set_theme!(Controlz.cool_theme)

# ╔═╡ d019ba92-af7f-4af8-96bd-0965bd1e5316
update_theme!(fontsize=30)

# ╔═╡ c944f35a-394c-4d7a-8e84-82252e44908e
md"## dynamics of the liquid level in a manometer

(see written portion of studio)
"

# ╔═╡ 0d4bc9de-c646-40d6-a536-a0e4ea03d49c
html"<img src=\"https://raw.githubusercontent.com/SimonEnsemble/CHE361_W2024/main/studios/manometer.png\" width=200>"

# ╔═╡ a6818132-831d-4248-ad7e-edf7361e228e
md"
below, parameters describing the geometry of the manometer and the amount of liquid in the manometer are specified---as well as the acceleration due to gravity on earth.
"

# ╔═╡ db45c400-0540-444a-8879-cffb8ff1c402
begin
	# geometric properties of the tube
	R = 0.02 # m
	L = 0.2  # m
	
	# physical constants
	g = 9.81 # m² / s
end

# ╔═╡ 243ce233-a6b8-47f1-87d5-c3e63f9cdb59
md"
### constructing and analyzing the transfer functions
🍯 consider two different situations:
1. the liquid in the manometer is olive oil
2. the liquid in the manometer is honey. 

the viscosity and density of both liquids are below."

# ╔═╡ d11e19e4-0363-4d4c-9061-deba86b61973
begin
	# olive oil
	μ_oil = 84.0 * 0.001  # Pa ⋅ s
	ρ_oil = 920.0         # kg / m³
end

# ╔═╡ a6158698-8ae2-4b04-9d05-725c0f9cd576
begin
	# honey
	μ_honey = 10000 * 0.001  # Pa ⋅ s
	ρ_honey = 1400.0         # kg / m³
end

# ╔═╡ 49d39849-9941-4292-8f68-525b3e54ffa8
md"🍯 use `Controlz.jl` to construct `G_oil` and `G_honey` to represent the transfer functions for how $H(s)$ responds to $P(s)$ under both of these situations."

# ╔═╡ 6e3fe31a-a5df-4a6b-9b84-34eea2f1f749
"""
	G(ρ, μ)

return transfer function of manometer when liquid has density ρ and visocity μ.
"""

# ╔═╡ 2fe444f5-d71e-4462-882c-4edf6ab7ccf5


# ╔═╡ f54d3cb6-b3ba-40ee-b3af-8cdd8abf2f7e


# ╔═╡ 21a9c71e-a18e-446e-b750-e8210809fa76
md"🍯 visualize the poles and zeros of the two transfer functions.

note where they lie in the complex plane."

# ╔═╡ 5e82de97-a092-49f5-a604-206ec8bfe0e6


# ╔═╡ 6bce2d7e-f5ad-4c46-b6ba-0dc968a4d587


# ╔═╡ a534855a-4dfb-43a5-88b7-c249f411a4a7
md"🍯 use `Controlz.jl` to compute the damping coefficient and time constant of both transfer functions.

!!! hint
	see the `damping_coefficient` and `time_constant` functions [here](https://simonensemble.github.io/Controlz.jl/dev/tfs/#(0,-2)-order-transfer-functions), which operate on second-order transfer functions.
"

# ╔═╡ 9e2d1c63-47a8-4456-8034-f5d39edadae6


# ╔═╡ 26352bcf-c760-45e7-af9b-b27693df46d7


# ╔═╡ 88281a0a-8914-4f6f-9680-b98a6a8525d9


# ╔═╡ 0912bafb-2e08-4637-889f-81f02e256c2c


# ╔═╡ 610f066c-6530-4285-92ef-d2210ae8fb14
md"🍯 based on the (i) location of the poles and (ii) value of the damping coefficient for the oil- and honey-based manometer, do you expect to see oscillations in the response to a step in pressure?

🦫: for the manometer with olive oil, I expect to [**see / not see**] oscillations in the liquid level in response to a step in pressure because the poles [**...**] and because the damping coefficient $\xi$ [**...**].

🦫: for the manometer with honey, I expect to [**see / not see**] oscillations in the liquid level in response to a step in pressure because the poles [**...**] and because the damping coefficient $\xi$ [**...**].
"

# ╔═╡ a06030e5-41b7-469f-bf37-52077732cdf1
md"
## simulating the step response
🍯 suppose the pressure on the left end of the tube suddenly increases by 1000 Pa at $t=0$ and is held there indefinitely. define as the variable `P` the input $P(s)$ to which this corresponds (for `Controlz.jl`).
"

# ╔═╡ 8a5c6165-1a24-492b-9a34-4808a515b82d


# ╔═╡ 7d4be411-8c20-45be-807d-0553c2cac5f7
md"🍯 define variables `H_oil` and `H_honey` as the liquid level $H(s)$ in response to this pressure increase for the two situations. use your transfer functions `G_oil` and `G_honey` above."

# ╔═╡ d9c52f83-92b9-41b9-a211-297159f7ba6d


# ╔═╡ 8901ef3e-e63f-4830-ac38-8f09dee91194


# ╔═╡ ea69d3e3-5666-4340-bbff-f4c100b26cc3
md"🍯 finally, use `Controlz.jl` to `simulate` the step response of the manometer under the two situations. draw a plot showing the response $h(t)$ for each.

* for the oil-based manometer, simulate for 5 s.
* for the honey-based manometer, simulate for 20 s.
* include an x- and y-axis label with units---and a title to indicate whether the response corresponds to honey or olive oil.

!!! hint
	see [here](https://simonensemble.github.io/Controlz.jl/dev/sim/#response-of-an-underdamped-second-order-system-to-a-unit-step-input) for an example.
"

# ╔═╡ aa362762-9b70-45c6-bd90-dbd7a5c22af3
begin
	final_time_honey = 20.0 # s
	final_time_oil = 5.0 # s
end

# ╔═╡ 3b2b0cb1-a6bc-4926-8825-7b7ac323d69c


# ╔═╡ 2398faa1-fa96-4af1-b3c6-e0bf86ce48fc


# ╔═╡ f8c68c46-1f9e-415e-98c1-6cfa7f0e8a4d


# ╔═╡ 2859869a-c5b7-4339-a947-c0e44ad8d9bc


# ╔═╡ c09031b4-942e-41bc-8889-63f099b446b8
md"🍯 compare the step responses of the oil-based and honey-based manometer.


[**your notes**]
"

# ╔═╡ Cell order:
# ╠═8262d07a-8bab-11ec-31db-411afb7cd7b0
# ╠═ed800089-6d69-4ec2-af09-242d2c396ff0
# ╠═d019ba92-af7f-4af8-96bd-0965bd1e5316
# ╟─c944f35a-394c-4d7a-8e84-82252e44908e
# ╟─0d4bc9de-c646-40d6-a536-a0e4ea03d49c
# ╟─a6818132-831d-4248-ad7e-edf7361e228e
# ╠═db45c400-0540-444a-8879-cffb8ff1c402
# ╟─243ce233-a6b8-47f1-87d5-c3e63f9cdb59
# ╠═d11e19e4-0363-4d4c-9061-deba86b61973
# ╠═a6158698-8ae2-4b04-9d05-725c0f9cd576
# ╟─49d39849-9941-4292-8f68-525b3e54ffa8
# ╠═6e3fe31a-a5df-4a6b-9b84-34eea2f1f749
# ╠═2fe444f5-d71e-4462-882c-4edf6ab7ccf5
# ╠═f54d3cb6-b3ba-40ee-b3af-8cdd8abf2f7e
# ╟─21a9c71e-a18e-446e-b750-e8210809fa76
# ╠═5e82de97-a092-49f5-a604-206ec8bfe0e6
# ╠═6bce2d7e-f5ad-4c46-b6ba-0dc968a4d587
# ╟─a534855a-4dfb-43a5-88b7-c249f411a4a7
# ╠═9e2d1c63-47a8-4456-8034-f5d39edadae6
# ╠═26352bcf-c760-45e7-af9b-b27693df46d7
# ╠═88281a0a-8914-4f6f-9680-b98a6a8525d9
# ╠═0912bafb-2e08-4637-889f-81f02e256c2c
# ╟─610f066c-6530-4285-92ef-d2210ae8fb14
# ╟─a06030e5-41b7-469f-bf37-52077732cdf1
# ╠═8a5c6165-1a24-492b-9a34-4808a515b82d
# ╟─7d4be411-8c20-45be-807d-0553c2cac5f7
# ╠═d9c52f83-92b9-41b9-a211-297159f7ba6d
# ╠═8901ef3e-e63f-4830-ac38-8f09dee91194
# ╟─ea69d3e3-5666-4340-bbff-f4c100b26cc3
# ╠═aa362762-9b70-45c6-bd90-dbd7a5c22af3
# ╠═3b2b0cb1-a6bc-4926-8825-7b7ac323d69c
# ╠═2398faa1-fa96-4af1-b3c6-e0bf86ce48fc
# ╠═f8c68c46-1f9e-415e-98c1-6cfa7f0e8a4d
# ╠═2859869a-c5b7-4339-a947-c0e44ad8d9bc
# ╟─c09031b4-942e-41bc-8889-63f099b446b8
