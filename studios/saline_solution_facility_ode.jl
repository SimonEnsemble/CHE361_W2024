### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 10584412-7a33-11ec-2593-c1520e9673b3
begin
	import Pkg; Pkg.activate()
	
	using DifferentialEquations, CairoMakie, Roots, DataFrames, PlutoUI
end

# ╔═╡ 5ef8147c-1d07-4367-a93d-416a9b7417b3
update_theme!(linewidth=4, fontsize=20)

# ╔═╡ 04ab13f8-0698-465a-882c-ac6128cd810b
md"
# numerically solving ODEs and simulating the saline solution facility

**learning objectives:**
* use `DifferentialEquations.jl` (documentation [here](https://docs.sciml.ai/DiffEqDocs/stable/getting_started/#Example-1-:-Solving-Scalar-Equations)) to numerically solve (well, approximate the solution to) nonlinear differential equations.
* explore concepts in process dynamics (how an input affects an output), in the context of our simple saline production facility.
"

# ╔═╡ 3e141f28-7126-4108-948f-13634ed02257
md"## saline solution facility

a dynamic model of the process to produce saline solution (see lecture notes and hw1):
```math
\begin{equation}
    V \frac{dc}{dt} = w - c \left[q-\frac{\alpha-1}{\rho_w} w \right]
\end{equation}
```

#### parameters (constant)
*  $V$ [L]: volume of liquid in the tank
*  $\alpha$ [g solution /g salt]: describes dependence of the density of the saline solution on the salt concentration
*  $\rho_w$ [g / L]: density of pure water

#### inputs
*  $q(t)$ [L water/ s]: incoming volumetric flow rate of pure water
*  $w(t)$ [g salt / s]: incoming gravimetric flow rate of solid salt granules

#### output
*  $c(t)$ [g salt/L solution]: concentration of salt in the outlet stream
"

# ╔═╡ 82c8f328-0243-4108-80a3-07dce9fe7c1f
html"<img src=\"https://github.com/SimonEnsemble/CHE_361_W2023/blob/main/images/salt_mixer.png?raw=true\" width=400>"

# ╔═╡ 5fa98241-6651-4363-99bf-20604f079ad3
md"
### problem setup
take the parameters as:                                                            
*  $V=10$ L                                         
*  $\alpha=0.64$ g / g                                                              
*  $\rho_w=1000$ g/L 
also, the water input as constant:
*  $q(t)=\bar{q}=0.1$ L/s     

!!! note \"task\"
	our task then in this studio is to predict how the output $c(t)$ behaves in response to a time-varying input $w(t)$ (described later). the other input, $q(t)=\bar{q}$, is constant with time.
	
🐝 define `V`, `α`, `ρw`, and `q̄` as variables in Julia in the cell below. we shall use these variables in the rest of the code.
"  

# ╔═╡ 548d1f73-8772-4ede-b1c6-e6bf31d21138
begin    
	# parameters
    
	# constant input
end 

# ╔═╡ 3c729599-4be0-422d-9a66-fc871f246729
md"
### computing the desired salt input rate

!!! example \"customer standards\"
	the customer (a hospital) wishes for saline solution with a salt concentration of $\bar{c}=0.1$ g/L. however, they will accept (buy) saline solution with salt concentration $c\in[0.09, 0.11]$ g/L. ie., the customer standards are for the saline solution to have a salt concentration within 0.01 g/L of the target $\bar{c}$.                                                      
" 

# ╔═╡ db3976e0-5430-45a4-9d2f-6ad360c134ee
c̄ = 0.1 # desired salt concentration, g/L

# ╔═╡ ae760afc-1704-4992-9fb0-8bc770569d8c
md"🐝 to produce saline solution that meets the customer specifications, we wish to achieve and maintain an output salt concentration of $\bar{c}$ at steady state conditions. given the value of the constant incoming flow rate of water, $\bar{q}$, compute the corresponding steady state value $\bar{w}$ [g/s] of the incoming salt flow rate, $w$, that we should maintain. assign it as a variable `w̄`.
"

# ╔═╡ e1e14dd3-fe8d-4705-a541-27b3b7f449da


# ╔═╡ 72bfb292-2b6b-46fc-98a9-81017fb9bd1d
md"
### a disturbance in the incoming salt

suppose the process is initially ($t=0$) operating at steady state---with the proper inlet salt flow rate $\bar{w}$ and producing saline solution with salt concentration $\bar{c}$. this implies that the salt concentration in the solution in the tank is initially $\bar{c}$ as well.

these steady state conditions are maintained until $t=100$ s.

at $t=100$ s, the conveyor belt loses power and shuts off (thus, no salt is fed into the tank). 
only at $t=250$ s does the engineer on staff address the problem and switch the conveyor belt back on to its normal speed to (immediately) achieve $\bar{w}$ again for the input salt concentration.

🐝 model this input $w=w(t)$ as a rectangular pulse---a piecewise flat function. write it mathematically as a piecewise function by editing this markdown cell.

```math
\begin{equation}
w(t) = \begin{cases}
?? , & t<?? \\
??, & ??<t<??\\
??, & t>??
	\end{cases}
\end{equation}
```
"

# ╔═╡ e8e2333d-eef1-4f35-becf-4c31ba95f238
md"
🐝 code-up this rectangular pulse input $w(t)$ as a function in Julia, `w(t)`, that takes the time `t` as input and returns the value of `w` at that time `t`. 

!!! hint
	you will need to write an `if` `else` statement. see [here](https://docs.julialang.org/en/v1/manual/control-flow/).
"

# ╔═╡ 4d09665d-31f9-4836-a68e-33d83b224fd3


# ╔═╡ ce1a816a-a60b-40b0-a300-e240e508acb6
md"🐝 to verify your `w(t)` function, use it to plot this rectangular pulse input $w(t)$ over the domain $t\in[0,12]$ min (**check units**). include x- and y-axis labels and a title \"rectangular pulse function\".
"

# ╔═╡ 7955eb9d-61df-42e9-953b-b042c0d2542c


# ╔═╡ dbe43e13-7137-41d3-b56f-090b478d625a


# ╔═╡ a78430b5-b763-4523-9895-3be19b809ea5
md"🐝 sketch out what you anticipate the output salt concentration $c(t)$ to look like in response to this rectangular pulse input $w(t)$. this should test your intuition of process dynamics.

### 🚀 simulation time! 🚀

🐝 use `DifferentialEquations.jl` to simulate $c(t)$, the concentration of salt in the outlet stream of the process in response to this disturbance, for $t\in[0, 12]$ min (**check units**). 
* plot the numerical solution, $c(t)$, for $t\in[0, 12]$ min.
  * include x- and y-axis labels indicating which variable is on the axis and its units.
* plot a black, horizontal, dashed line at $\bar{c}=0.1$ g/L.
* enforce y-axis limits from 0 to a little above c̄. this gives perspective of how close the water is to being pure.

!!! hint
	see `DifferentialEquations.jl` docs [here](https://docs.sciml.ai/DiffEqDocs/stable/getting_started/#Example-1-:-Solving-Scalar-Equations).

!!! hint
	with the view $dc/dt=f(c, t)$, use the time argument, `t`, in your Julia function `f(c, p, t)`, by passing it to your `w(t)` to retreive the value of $w$ at that time.

!!! hint
	you will see an unphysical blip in the solution, owing to a discontinuity in the input. to alleviate this numerical artifact, pass `d_discontinuities=[100.0, 250.0]` to `ODEProblem` to increase the resolution around the discontinuities.
"

# ╔═╡ 434aaccc-d0b7-43fb-923f-89e92eba6153


# ╔═╡ a6cfd7c8-5557-4260-a8d3-c3342ff26e61


# ╔═╡ 2f0f38ab-dab4-421d-89f8-18f9afa6d03c


# ╔═╡ fbf03ff1-27d6-4fdb-a523-6757ba3a5a7c


# ╔═╡ b67f3967-1cda-44d0-8243-ce603f5f913a
md"
🐝 does the solution $c(t)$ conform to your expectations? explain the shape of the response curve to your neighbor.

🐝 owing to the conveyor belt outage, for what time interval is the process producing saline solution that does not meet customer standards?

!!! hint
	although this can be done with a `for` loop, you can use `findfirst` and `findlast`. see [here](https://docs.julialang.org/en/v1/base/arrays/#Base.findfirst-Tuple{Any}).
"

# ╔═╡ 9f5a3ee7-5505-4d34-bfa5-f1f0844f853d


# ╔═╡ dc8e7160-690d-489e-8f7c-3efd85530876
md"🐝 verify your calculation above by (i) replotting $c(t)$ and (ii) using:
```julia
vspan!(ax, t_start, t_end, color=(:red, 0.2))
```
to highlight, on the same plot, the time interval over which the saline solution cannot be sold. see the [`CairoMakie.jl` docs](https://docs.makie.org/stable/reference/plots/hvspan/).
"

# ╔═╡ 0d0e6241-dbc9-418b-b696-8f2922b023ed


# ╔═╡ Cell order:
# ╠═10584412-7a33-11ec-2593-c1520e9673b3
# ╠═5ef8147c-1d07-4367-a93d-416a9b7417b3
# ╟─04ab13f8-0698-465a-882c-ac6128cd810b
# ╟─3e141f28-7126-4108-948f-13634ed02257
# ╟─82c8f328-0243-4108-80a3-07dce9fe7c1f
# ╟─5fa98241-6651-4363-99bf-20604f079ad3
# ╠═548d1f73-8772-4ede-b1c6-e6bf31d21138
# ╟─3c729599-4be0-422d-9a66-fc871f246729
# ╠═db3976e0-5430-45a4-9d2f-6ad360c134ee
# ╟─ae760afc-1704-4992-9fb0-8bc770569d8c
# ╠═e1e14dd3-fe8d-4705-a541-27b3b7f449da
# ╟─72bfb292-2b6b-46fc-98a9-81017fb9bd1d
# ╟─e8e2333d-eef1-4f35-becf-4c31ba95f238
# ╠═4d09665d-31f9-4836-a68e-33d83b224fd3
# ╟─ce1a816a-a60b-40b0-a300-e240e508acb6
# ╠═7955eb9d-61df-42e9-953b-b042c0d2542c
# ╠═dbe43e13-7137-41d3-b56f-090b478d625a
# ╟─a78430b5-b763-4523-9895-3be19b809ea5
# ╠═434aaccc-d0b7-43fb-923f-89e92eba6153
# ╠═a6cfd7c8-5557-4260-a8d3-c3342ff26e61
# ╠═2f0f38ab-dab4-421d-89f8-18f9afa6d03c
# ╠═fbf03ff1-27d6-4fdb-a523-6757ba3a5a7c
# ╟─b67f3967-1cda-44d0-8243-ce603f5f913a
# ╠═9f5a3ee7-5505-4d34-bfa5-f1f0844f853d
# ╟─dc8e7160-690d-489e-8f7c-3efd85530876
# ╠═0d0e6241-dbc9-418b-b696-8f2922b023ed
