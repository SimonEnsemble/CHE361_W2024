### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ c110b070-742d-11ec-20d4-d3aa4debfe54
begin
	import Pkg; Pkg.activate()
	using CairoMakie, PlutoUI, Printf
end

# ╔═╡ f0c4e102-16b3-476d-a398-70df362aaf0f
set_theme!(theme_light()); update_theme!(fontsize=20, linewidth=3)

# ╔═╡ 9e45aabc-adfa-440e-82f7-437677a2c36b
TableOfContents()

# ╔═╡ 6b27e69f-5394-4e8b-bbd9-ec1ea169900b
md"
## a conical tank emptying of liquid

✏ derive a dynamic model of the liquid level, $h=h(t)$ [m], in a conical tank as liquid autonomously flows out of it, through a pipe at the bottom with a small valve providing a narrow constriction for the outflow.

![](https://raw.githubusercontent.com/SimonEnsemble/CHE_361_W2022/main/studios/conical_tank.png#raw)

🚰 **tank geometry** is an inverted, right circular cone (see [here](https://en.wikipedia.org/wiki/Cone)).
* right cone $\implies$ axis passes through the center of the base and is orthogonal to the base
* circular cone $\implies$ base is a circle
* inverted cone $\implies$ base is on the top
* height of the cone is $H$ [m]
* the radius of the circle forming the base is $R$ [m]

🚰 **initial condition**:
* the tank is initially full to the very brim

🚰 **other assumptions**:
* the density of the liquid $\rho$ [kg/m$^3$] is constant 
* flow out of the tank is driven by hydrostatic pressure. the flow rate of liquid out of the tank is related to the liquid level as $c\sqrt{h(t)}$ [m$^3$/s]

your dynamic model should be an ODE in $h=h(t)$ and involve *only* the variables $H$, $R$, $c$, and $h$.

!!! hint
	write a mass balance in differential form. look for two similar triangles.

🚰 my model:
```math
\begin{equation}
\frac{dh}{dt}=f(h)
\end{equation}
```
where
```math
\begin{equation}
f(h):= {\color{red}
	\text{FILL IN}
}
\end{equation}
```
"

# ╔═╡ 87faaf32-c035-4578-9474-400f37943bb1
md"
## finite difference methods

**goal**: write code to find the numerical solution to your dynamic model, via a Forward Euler finite difference method, using the parameter settings below.
"

# ╔═╡ d7bc2e84-2c23-4497-995f-39ebde143803
begin
	H = 2.0     # m
	R = 0.4     # m
	c = 0.00175 # m ^ (5/2) / s. 
end

# ╔═╡ a5b69862-2448-4225-bf4e-55e4756de6a9
md"
🐸 declare the initial liquid level as a variable `h₀`.
"

# ╔═╡ f3c9aa61-fd22-482b-9808-5f423f23dbc9


# ╔═╡ 626e5ea3-ff66-4455-bc05-aafa1725ba74
md"🐸 code up the function `f(h)` above that characterizes the dynamics of $h(t)$ through your differential equation model $\frac{dh}{dt} = f(h)$.
"

# ╔═╡ b7599381-2f2c-4cdf-898b-214a91436597


# ╔═╡ 9760b691-be94-4d8c-a5d0-56568b9810bd
md"
🐸  to set up our finite difference approximation, define the variable representing the time step, `Δt`, as 0.05 s.
"

# ╔═╡ 43e1b7c5-b71c-45c9-85c0-80eb3b9b837a


# ╔═╡ ed761a64-1708-4b85-8cc6-cf83d51342dc
md"🐸 we wish to simulate the model in the time interval $t \in [0, 3]$ min. define the variable `tₙ` as the final time **in seconds**, after we take the `n` time steps to arrive at it."

# ╔═╡ 7993b7e5-3e02-4863-a610-3471008afcb8


# ╔═╡ 3295e2fe-baea-4766-9210-f21f1ec435c1
md"🐸 compute the number of time steps we need to take with our Δt to arrive at the final time tₙ. assign it as a variable `n` in terms of `Δt` and `tₙ` so that we can change the time step later and have `n` automatically update. 

!!! note
	it's important to make `n` an integer by casting it as an `Int` so we can later write a `for` loop like `for i = 1:n`. you can achieve this by rounding `n` that you computed to the nearest integer. e.g., explore the output of `round(Int, 4.01)`.
"

# ╔═╡ f27010b6-6f09-4217-9df9-3feb462cb488


# ╔═╡ ee8abcf8-0565-48ff-8d86-9666961907ac
md"🐸 discretize time by constructing an array `t` containing the time points $t_i$. ie. element $i$ of the array `t` should be equal to $t_i= \Delta t (i-1)$ for $i \in \{1, 2, ..., n+1\}$. 


!!! note
	the size of the array `t` is `n+1`. we go up to $n+1$ because the first element of `t` should be zero. the last entry of the `t` array should be `tₙ`.

!!! hint
	preallocate an array of zeros. loop through each entry. inside the loop, overwrite the entries with the appropriate value. or, use a [comprehension](https://docs.julialang.org/en/v1/manual/arrays/#man-comprehensions). 
"

# ╔═╡ bfdc82ed-b34d-412e-afe7-3529aaeaecd7


# ╔═╡ 04e15fa7-b44e-4b4c-a5da-535e2e9f2f05
# or

# ╔═╡ 84960114-4700-483b-82e1-92711acf8e74
md"
🐸 we will store the approximations to the solution, the $h_i \approx h(t_i)$'s, in an array `h`. 

1. pre-allocate the array `h` as an array of zeros, of the appropriate size to correspond to `t`. we'll overwrite these zeros later with the $h_i$ values. ie. entry $i$ of the array `h` will hold our approximation to $h(t_{i-1})$ for $i \in \{1, 2, ..., n+1\}$.
2. assign the first element of `h` to be the initial condition, `h₀`.
"

# ╔═╡ e57b612d-605d-4cbd-bcf8-e1a89ec9259a


# ╔═╡ d284fba1-56f7-42ec-a615-48ddeb4ff903
md"
🐸 implement the forward Euler method to approximate the solution to this ODE and fill in the remaining entries of `h`. march ahead in time for `n` steps, via a `for` loop. 


!!! warning
	use all of the following that you defined earlier:
	* the `h` array
	* the `t` array
	* `Δt`
	* `f(h)`

!!! note
	you should see a `DomainError`. the domain error comes from passing a negative value of $h$ into a square root function contained in $f(h)$. 

	this happens at the time point when the tank is fully emptied and the dynamics are \"over\", but there is a little bit of error originating from the finite difference approximation---making $h(t)$ spuriously drop a little below zero. 

	to address this error, *when the tank finally becomes empty* inside the for loop, stop the time stepping since we know $h(t)=0$ for this time point and beyond. hint: I used a `break`. see [here](https://docs.julialang.org/en/v1/manual/control-flow/#man-loops).
"

# ╔═╡ b98527cd-2424-417a-9751-cedfafb0fc14


# ╔═╡ fe939caa-a5fa-41c6-9a27-3dd0c82825cb
md"
🐸 plot your numerical solution $h(t)$, via plotting `h` vs `t`.

include an `xlabel` and `ylabel`. be sure to indicate the units. this is proper data visualization practice.

!!! hint
	if you see a little blip below zero in your plot at the point where the tank empties of liquid, you need to assign `h[i]` at that time point to be zero inside your forward Euler routine.
"

# ╔═╡ 59e9b8ca-a72a-4929-8d5f-1402eff23140


# ╔═╡ 10e851c4-0d3c-472f-a585-4be551d2871c
md"
🐸 _if the tank were instead cyclindrical_, would the liquid level drop faster early or later in the emptying process?

[... your answer here ...]


🐸 _observe_: for this conical tank, does the liquid level drop faster early in the emptying process or later?

[... your answer here ...]

🐸 true or false. here, the volumetric flow rate out of this conical tank is faster later in the emptying process.

[... your answer here ...]


🐸 the tank-geometry and hydrostatic pressure are competing effects, then, in their influence over how fast the liquid level drops. which dominates here?

[... your answer here ...]
"

# ╔═╡ 78298965-50da-4ecd-8648-a118c0da809f
md"## comparing the numerical and analytical solution

💡 the best way to test your numerical initial value problem solver is to compare your numerical solution with the analytical solution. fortunately, this model has an analytical solution!
"

# ╔═╡ bb4755b6-a642-4db1-aa52-798bbeeeea3d
md"🐸 derive an analytical solution to the differential equation for $h(t)$ by separating variables and integrating. 

```math
\begin{equation}
h(t) = {\color{red} ??? \text{ FILL IN}}
\end{equation}
```
"

# ╔═╡ 7e05bec1-3c0b-4d51-81cc-f1b64f50b525
md"🐸 use the analytical solution to determine the time $t_e$ at which the tank empties, ie. the time that the liquid level first reaches zero:
```math
\begin{equation}
	t_e= \arg\min_{t : \hspace{0.4em} h(t)=0} h(t)
\end{equation}
```

compute $t_e$ and assign it as a variable `tₑ` below. is it consistent with your plot above (it should be!)?
"

# ╔═╡ 0d5304e7-74b4-4ff8-82d7-8d6f67419ecf


# ╔═╡ 4b02b8d8-84cb-464c-8619-48409f90047e
md"🐸 plot the analytical solution on top of the numerical solution to ensure they match (they should). since two curves are on the same plot panel, (i) include a legend and (ii) make one of the curves dashed.

!!! note
	the analytical solution has a $\sqrt{}$ function in it and is valid only for $t<t_e$. for $t>t_e$, $h(t)=0$. thus, when you write a function `h_true(t)` to plot the analytical solution, you must write an `if` statement to check if the `t` is less than or equal to the time at which the tank empties.

!!! hint
	see `axislegend` and `linestyle` in the `CairoMakie.jl` docs [here](https://docs.makie.org/stable/reference/blocks/legend/) and [here](https://docs.makie.org/stable/reference/plots/lines/).
"

# ╔═╡ 7286859c-6805-421c-ab4e-941d8a314192


# ╔═╡ d6d7af91-31ef-4e57-91bb-042617c40fb0


# ╔═╡ Cell order:
# ╠═c110b070-742d-11ec-20d4-d3aa4debfe54
# ╠═f0c4e102-16b3-476d-a398-70df362aaf0f
# ╠═9e45aabc-adfa-440e-82f7-437677a2c36b
# ╟─6b27e69f-5394-4e8b-bbd9-ec1ea169900b
# ╟─87faaf32-c035-4578-9474-400f37943bb1
# ╠═d7bc2e84-2c23-4497-995f-39ebde143803
# ╟─a5b69862-2448-4225-bf4e-55e4756de6a9
# ╠═f3c9aa61-fd22-482b-9808-5f423f23dbc9
# ╟─626e5ea3-ff66-4455-bc05-aafa1725ba74
# ╠═b7599381-2f2c-4cdf-898b-214a91436597
# ╟─9760b691-be94-4d8c-a5d0-56568b9810bd
# ╠═43e1b7c5-b71c-45c9-85c0-80eb3b9b837a
# ╟─ed761a64-1708-4b85-8cc6-cf83d51342dc
# ╠═7993b7e5-3e02-4863-a610-3471008afcb8
# ╟─3295e2fe-baea-4766-9210-f21f1ec435c1
# ╠═f27010b6-6f09-4217-9df9-3feb462cb488
# ╟─ee8abcf8-0565-48ff-8d86-9666961907ac
# ╠═bfdc82ed-b34d-412e-afe7-3529aaeaecd7
# ╠═04e15fa7-b44e-4b4c-a5da-535e2e9f2f05
# ╟─84960114-4700-483b-82e1-92711acf8e74
# ╠═e57b612d-605d-4cbd-bcf8-e1a89ec9259a
# ╟─d284fba1-56f7-42ec-a615-48ddeb4ff903
# ╠═b98527cd-2424-417a-9751-cedfafb0fc14
# ╟─fe939caa-a5fa-41c6-9a27-3dd0c82825cb
# ╠═59e9b8ca-a72a-4929-8d5f-1402eff23140
# ╟─10e851c4-0d3c-472f-a585-4be551d2871c
# ╟─78298965-50da-4ecd-8648-a118c0da809f
# ╟─bb4755b6-a642-4db1-aa52-798bbeeeea3d
# ╟─7e05bec1-3c0b-4d51-81cc-f1b64f50b525
# ╠═0d5304e7-74b4-4ff8-82d7-8d6f67419ecf
# ╟─4b02b8d8-84cb-464c-8619-48409f90047e
# ╠═7286859c-6805-421c-ab4e-941d8a314192
# ╠═d6d7af91-31ef-4e57-91bb-042617c40fb0
