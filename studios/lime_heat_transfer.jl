### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ b066bf9a-a363-4371-8433-47011b7e64c1
begin
	import Pkg; Pkg.activate()
	using DataFrames, CSV, CairoMakie, Optim
end

# ╔═╡ 702c01c6-1160-4513-9bfc-3e4b4d4bb22b
set_theme!(theme_ggplot2()); update_theme!(fontsize=20, linewidth=4, markersize=20)

# ╔═╡ e0798df0-dfe6-4582-9e30-1a3d50bb2f3e
pwd()

# ╔═╡ 2862c8f2-dbf2-11ee-21b1-df277ba573ab
md"# modeling heat transfer to a lime fruit

!!! note
	this studio uses experimental data from:
	> \"A tutorial on the Bayesian statistical approach to inverse problems.\" F. Waqar, S. Patel, C. Simon. _APL Machine Learning_. 2023. [link](https://pubs.aip.org/aip/aml/article/1/4/041101/2919936/A-tutorial-on-the-Bayesian-statistical-approach-to).

## experimental setup

we allowed a lime fruit (∼5 cm diameter) to reside in a refrigerator for several days. then, at time $t=0$ (min), we removed the lime from the refrigerator, placed it on a thin slab of insulating styrofoam, and allowed it to exchange heat with the indoor air via natural convection. an electrical-resistance-based temperature sensor inserted into the lime allows us to measure its internal temperature at any given time $t$ to generate a data point $(t_i, \theta_i)$. to avoid the early-time data reflecting the (short) time dynamics of the temperature probe coming into thermal equilibrium with the lime, owing to its nonzero thermal mass, we inserted the probe into the lime before we placed it in the refrigerator, so it begins thermally equilibrated with the lime.
the figure below shows our experimental setup.
"

# ╔═╡ b3412774-d3e7-431b-9ff7-d1a4e3f3d0d5
html"<img src=\"https://raw.githubusercontent.com/SimonEnsemble/CHE361_W2024/main/studios/lime_setup.jpeg\" width=320>"

# ╔═╡ 3c967f38-ef8d-40f5-9447-0899dc9ab529
md"## the training data

we describe the training data we employ to develop a model of the heat transfer of the lime.


first, we measured the temperature of the ambient air and the refrigerator, which we assume to be constants (ie., not changing with time).
"

# ╔═╡ ccd9459f-045a-41b7-bfd1-592023b8cc59
θᵃⁱʳ_ambient = 18.7 # °C

# ╔═╡ 459e734a-455e-479e-84d7-23c48f3f3a47
θᵃⁱʳ_fridge = 6.5 # °C

# ╔═╡ 8873aa4e-64dc-4f94-9ebd-d07c93a6195b
md"second, we measured the lime temperature at different times over the course of the heat transfer experiment, giving time series data $\{(t_i, \theta_i)\}_{i=0}^{N=12}$.

🐛 read in the data in `train_data.csv` as a `DataFrame`.
"

# ╔═╡ d762ac6d-8627-4e70-a23c-9bb74ee644ae

# ╔═╡ 739a6587-f74e-4b55-b8cf-2ef7e3210e35
md"🐛 plot the time series data as scattered points and the ambient and refrigerator air temperature as horizontal dashed lines. include an x- and y-axis label. does the shape of the data make sense?

!!! hint
	this should look like Fig. 7a in Waqar et al. 
"

# ╔═╡ 06605daf-d220-4b53-b7e1-56def7d6f665

# ╔═╡ f476d4ae-5084-4e28-ba9f-8ed66975127c

# ╔═╡ a3f0e6c7-abe6-407b-b510-2eff67094481
md"## formulate a transfer function model for the lime temperature

💡 the output is the lime temperature $\theta(t)$. the input is the air temperature $\theta^{\rm air}(t)$.

#### time domain

formulate a mathematical model (a differential equation) for the lime temperature $\theta(t)$ [°C] that characterizes the heat transfer into the lime in response to any air temperature $\theta^{\rm air}(t)$. the model should constitute a differential equation with a *single* unknown, lumped parameter---a time constant $\tau$ [min]. 
* invoke Newton's law of cooling
* treat the temperature of the lime as spatially uniform

!!! hint
	read Sec. IIB of Waqar et al.

#### frequency domain

🐛 derive the transfer function $G(s)=\Theta^*(s) / \Theta^{\rm air, *}(s)$ that governs how the air temperature affects the lime temperature, where $\Theta^*(s):=\mathcal{L}[\theta^*(t)]$. 

!!! hint
	the transfer function should be first order with an unknown time constant $\tau$.

#### input

🐛 what is the particular input $\Theta^{\rm air, *}(s)$ corresponding to this experiment with the lime?

#### output

🐛 use the transfer function to write the output $\Theta^*(s)$ in response to this input. invert it into the time domain to solve for $\theta(t)$ in response to this input.

!!! hint
	see notes on first-order step response. check with eqn. (14) of Waqar et al.

#### code up the output

🐛 write a function `θ(t, τ)` that predicts the lime temperature at time $t$ for a given time constant $\tau$.

!!! note
	the time constant τ is unknown at this point. this function will allow us to assess how well different τ's fit the time series data of the lime temperature.
"

# ╔═╡ 8b520989-ba01-42ea-9a0c-f9b94e5cd75e

# ╔═╡ ec24e83d-ed92-4ee2-be38-0005df4b0a27
md"## parameter identification

use the lime temperature time series data to identify the unknown time constant $\tau$ governing the dynamics of heat transfer from air into the lime via natural convection.

* 🐛 code-up a least squares loss function of τ
* 🐛 plot the loss function to see an optimum
* 🐛 use `Optim.jl` to solve for the optimum τ (see [here](https://julianlsolvers.github.io/Optim.jl/stable/#user/minimization/#minimizing-a-univariate-function-on-a-bounded-interval))
* 🐛 plot the fit model (ie. the model $θ(t, \tau_{\rm opt})$ with the optimal $\tau$, $\tau_{\rm opt}$) on top of the time series data to assess quality of fit.
"

# ╔═╡ 68c62f2a-010a-4177-b627-60c5a90851ab

# ╔═╡ a578a859-c1aa-4939-9a16-c9ff07f04bc6

# ╔═╡ 41ce3b17-170c-426f-b2e6-497ca5b6cd6d

# ╔═╡ f7f6a81c-836f-4a77-9041-879462d0921f

# ╔═╡ Cell order:
# ╠═b066bf9a-a363-4371-8433-47011b7e64c1
# ╠═702c01c6-1160-4513-9bfc-3e4b4d4bb22b
# ╠═e0798df0-dfe6-4582-9e30-1a3d50bb2f3e
# ╟─2862c8f2-dbf2-11ee-21b1-df277ba573ab
# ╟─b3412774-d3e7-431b-9ff7-d1a4e3f3d0d5
# ╟─3c967f38-ef8d-40f5-9447-0899dc9ab529
# ╠═ccd9459f-045a-41b7-bfd1-592023b8cc59
# ╠═459e734a-455e-479e-84d7-23c48f3f3a47
# ╟─8873aa4e-64dc-4f94-9ebd-d07c93a6195b
# ╠═d762ac6d-8627-4e70-a23c-9bb74ee644ae
# ╟─739a6587-f74e-4b55-b8cf-2ef7e3210e35
# ╠═06605daf-d220-4b53-b7e1-56def7d6f665
# ╠═f476d4ae-5084-4e28-ba9f-8ed66975127c
# ╟─a3f0e6c7-abe6-407b-b510-2eff67094481
# ╠═8b520989-ba01-42ea-9a0c-f9b94e5cd75e
# ╟─ec24e83d-ed92-4ee2-be38-0005df4b0a27
# ╠═68c62f2a-010a-4177-b627-60c5a90851ab
# ╠═a578a859-c1aa-4939-9a16-c9ff07f04bc6
# ╠═41ce3b17-170c-426f-b2e6-497ca5b6cd6d
# ╠═f7f6a81c-836f-4a77-9041-879462d0921f
