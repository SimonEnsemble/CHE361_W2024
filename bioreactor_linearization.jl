### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ 75eebb20-bdef-11ed-1d40-1f6907086c82
begin
	import Pkg; Pkg.activate()
	using NLsolve, Symbolics, Controlz, PlutoUI
	using ForwardDiff: gradient
	using Symbolics: simplify, solve_for

	Controlz.update_theme!(Controlz.cool_theme)
	TableOfContents()
end

# ╔═╡ 6364b356-47e5-4f54-97c9-36989bf3bbd1
md"# a continuous bioreactor

consider a continuous flow bioreactor (see lecture notes). suppose the incoming feed is sterile ($b_f(t)=0$ in our notes) and the concentration of substrate in the feed is constant at $x_f(t)=\bar{x_f}$. 
"

# ╔═╡ 28562892-dd56-4496-9ee9-978566a0280e
html"<img src=\"https://raw.githubusercontent.com/SimonEnsemble/CHE361_W2024/main/studios/bioreactor.png\" width=300>"

# ╔═╡ 7e2cc484-a298-4cd3-b5b5-447bab09cab6
md"
the dynamic model for this bioreactor is:

```math
\begin{align}
    \frac{db}{dt} &= - \frac{f(t)}{V} b(t) + \mu_{\text{max}}\frac{x(t)}{K_S+x(t)}b(t) -d b(t) \\
    \frac{dx}{dt} &= \frac{f(t)}{V}[\bar{x_f}-x(t)] - \left( Mb(t)+\mu_{\text{max}}\frac{x(t)}{K_S+x(t)}b(t) \frac{1}{Y} \right)
\end{align}   
```

💡 a single input, the feed flow rate, $f(t)$, affects two outputs, the concentration of microbes $b=b(t)$ and concentration of substrate $x=x(t)$ in the bioreactor.

the parameters for the model of the bioreactor are defined below.
"

# ╔═╡ e8474cd3-9a50-42f6-b4b6-f963e05dd053
begin
	### substrate consumption
	# for maintenance
	M = 0.05    # g substrate to keep micro-organisms alive / [g micro-organisms - hr]

	# for growth
	Y = 0.2     # g micro-organisms / g substrate to produce micro-organisms

	### yeast growth model
	# Monod params
	μₘₐₓ = 2.88 # 1 / hr
	Kₛ = 4.0    # g substrate / L
	# death rate
	d  = 0.05   # 1 / hr

	### volume of bioreactor
	V = 1.45     # L

	### concentration of substrate in the feed (fixed)
	x̄_f = 7      # g substrate / L
end

# ╔═╡ f415b087-0094-48e8-b1b3-3ec4204e30bc
md"
### the steady-state conditions
abstract the model as
```math
\begin{align}
\frac{db}{dt} &= g_b(\mathbf{z}) \\
\frac{dx}{dt} &= g_x(\mathbf{z})
\end{align}
```
with
```math
\mathbf{z}=\begin{bmatrix} b \\ x \\ f \end{bmatrix}.
```
so the functions $g_b:\mathbb{R}^3\rightarrow \mathbb{R}$ and $g_x:\mathbb{R}^3\rightarrow \mathbb{R}$ constitute the right-hand-side of the ODEs governing $b(t)$ and $x(t)$, respectively, and characterize their dynamics.

🐛  define the two corresponding functions as `g_b(z)` and `g_x(z)` in Julia.

!!! note
	we are doing this to set up for the next steps, of (i) finding the steady-state values of the outputs, $\bar{x}$ and $\bar{b}$, and (ii) linearizing the model. so, later on, be sure to use these functions `g_b` and `g_x` you code up here.
"

# ╔═╡ 03c96301-1cb6-4249-b97f-e3128f146717


# ╔═╡ 2f743862-4608-48ed-a813-74aa4e2bad02


# ╔═╡ 26e69a12-b56b-4ccb-b437-997b895dca71
md"🐛 the steady-state value of the incoming flow rate of broth $\bar{f}$ is defined below. 
determine the corresponding steady state values of (1) the micro-organism concentration $\bar{b}$ and (2) the substrate concentration $\bar{x}$ in the bioreactor.

!!! hint
	use `nlsolve` from `NLsolve.jl`. see my tutorial [here](https://simonensemble.github.io/CHE_361_W2023/demos/html/solve_nonlinear_eqn_and_numerically_differentiate.jl.html).
"

# ╔═╡ 3c7e4f27-d097-4f77-b7e2-a2f0a4fffdb6
f̄ = 0.96 # L / hr

# ╔═╡ 9f6caabc-7fdc-4e8f-8503-bdbf12cbd86c


# ╔═╡ e0afc562-cf12-4836-b9c8-41ca8fb689ba


# ╔═╡ bd834687-a019-4c37-8ea8-4a5ae7204b1c


# ╔═╡ 3fcbca88-c72c-468f-986e-3144c8fb584b


# ╔═╡ 24b9bc20-1738-46ae-ac41-a9000db19c94
md"
### linearization of the model

🐛 now that we know the steady-state values $\bar{b}$, $\bar{x}$, and $\bar{f}$, we proceed to linearize the model.

numerically compute the _six_ partial derivatives needed to linearize this model.

!!! hint
	use `gradient` from `ForwardDiff.jl`. see [here](https://github.com/JuliaDiff/ForwardDiff.jl) for examples.
"

# ╔═╡ 99826be8-2b8c-4623-8c9b-ed2c78014bd1


# ╔═╡ 43701048-bb09-4673-b401-e4b79d9ba9b9


# ╔═╡ 48660e87-975b-4e1a-9281-79bd7e36c113
md"
### derivation of the transfer function $B^*(s)/F^*(s)$

🐛 using `Symbolics.jl`, derive the linearized transfer function model that determines the dynamics of how $F^*(s):=\mathcal{L}[F^*(t)]$ affects $B^*(s):=\mathcal{L}[b^*(t)]$. use the value of the partial derivatives you attained above. 

!!! hint
	see my tutorial [here](https://simonensemble.github.io/CHE_361_W2023/demos/html/solve_nonlinear_eqn_and_numerically_differentiate.jl.html).
" 

# ╔═╡ 961d8784-d732-4b4a-90e9-d710e049e4d0


# ╔═╡ 1d5de22c-c47d-48f8-8b0b-bb9b98e8b7fa


# ╔═╡ a761f0a4-1979-4bbc-acdf-82ccc50b6b83


# ╔═╡ c0b950d6-5bb0-4800-a050-ba10f80a0582


# ╔═╡ f19fe0f3-a59e-4f9a-94f9-16493370af72


# ╔═╡ d2a38ea7-b915-4048-a720-3f292c9fe37d


# ╔═╡ 1a455e37-9381-4395-a640-b0bbfdd79066
md"🐛 assign to a variable `G` your transfer function $B^*(s)/F^*(s)$. we will use it next to run a simulation in `Controlz.jl`.

!!! note
	feel free to round the numbers to the nearest decimal.
"

# ╔═╡ 24769cd9-f570-4a8e-a865-37645242186c


# ╔═╡ 4cacd435-def7-441e-834c-ef8c51895a3f
md"🐛 visualize the poles and zeros of your transfer function with `viz_poles_and_zeros`."

# ╔═╡ dd3fbf9b-0f74-4dd8-97fd-925fc977d6f4


# ╔═╡ 0fd6b0e6-b985-4fb3-bce7-cb7f68710bd1
md"
### employing the transfer function to simulate the response of $B^*(s)$ to a step in $F^*(s)$

let's put the transfer function to use!

🐛 suppose we have a unit step in the feed rate of substrate solution, $f(t)$. simulate and visualize the step response $b^*(t)$. explain the resonse. 

!!! hint
	do you see overshoot?! I did. see if you can explain the overshoot from a physical standpoint. _think_: a higher flow rate of broth will flush out the micro-organisms, _but_ it also replenishes the substrate... 🤯
"

# ╔═╡ 43012b0e-dad4-48b4-aa85-a30ef6c27c8e


# ╔═╡ dc1aa58d-0d0d-4488-92ad-514e7c704d47


# ╔═╡ 7e57c45d-6a14-4c6a-b439-20cfde95b087
md"
the shape of the response is explained by: [...]
"

# ╔═╡ Cell order:
# ╠═75eebb20-bdef-11ed-1d40-1f6907086c82
# ╟─6364b356-47e5-4f54-97c9-36989bf3bbd1
# ╟─28562892-dd56-4496-9ee9-978566a0280e
# ╟─7e2cc484-a298-4cd3-b5b5-447bab09cab6
# ╠═e8474cd3-9a50-42f6-b4b6-f963e05dd053
# ╟─f415b087-0094-48e8-b1b3-3ec4204e30bc
# ╠═03c96301-1cb6-4249-b97f-e3128f146717
# ╠═2f743862-4608-48ed-a813-74aa4e2bad02
# ╟─26e69a12-b56b-4ccb-b437-997b895dca71
# ╠═3c7e4f27-d097-4f77-b7e2-a2f0a4fffdb6
# ╠═9f6caabc-7fdc-4e8f-8503-bdbf12cbd86c
# ╠═e0afc562-cf12-4836-b9c8-41ca8fb689ba
# ╠═bd834687-a019-4c37-8ea8-4a5ae7204b1c
# ╠═3fcbca88-c72c-468f-986e-3144c8fb584b
# ╟─24b9bc20-1738-46ae-ac41-a9000db19c94
# ╠═99826be8-2b8c-4623-8c9b-ed2c78014bd1
# ╠═43701048-bb09-4673-b401-e4b79d9ba9b9
# ╟─48660e87-975b-4e1a-9281-79bd7e36c113
# ╠═961d8784-d732-4b4a-90e9-d710e049e4d0
# ╠═1d5de22c-c47d-48f8-8b0b-bb9b98e8b7fa
# ╠═a761f0a4-1979-4bbc-acdf-82ccc50b6b83
# ╠═c0b950d6-5bb0-4800-a050-ba10f80a0582
# ╠═f19fe0f3-a59e-4f9a-94f9-16493370af72
# ╠═d2a38ea7-b915-4048-a720-3f292c9fe37d
# ╟─1a455e37-9381-4395-a640-b0bbfdd79066
# ╠═24769cd9-f570-4a8e-a865-37645242186c
# ╟─4cacd435-def7-441e-834c-ef8c51895a3f
# ╠═dd3fbf9b-0f74-4dd8-97fd-925fc977d6f4
# ╟─0fd6b0e6-b985-4fb3-bce7-cb7f68710bd1
# ╠═43012b0e-dad4-48b4-aa85-a30ef6c27c8e
# ╠═dc1aa58d-0d0d-4488-92ad-514e7c704d47
# ╠═7e57c45d-6a14-4c6a-b439-20cfde95b087
