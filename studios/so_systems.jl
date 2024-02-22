### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ 9c577493-dcb3-42a1-a4e2-3dd441038633
begin
	import Pkg; Pkg.activate()
	using Controlz, CairoMakie, DataFrames, ColorSchemes
end

# ╔═╡ 14c3b290-2eaf-423c-9305-1fa146deac10
set_theme!(Controlz.cool_theme)

# ╔═╡ 9bd7f8bc-902b-11ec-32fd-8d5830e04421
md"
# second order (SO) transfer functions

a second order transfer function $G(s)$ governing the response of an output $y(t)$ to changes in an input $u(t)$ is:
```math
\begin{equation}
    G(s)= \frac{Y^*(s)}{U^*(s)} = \frac{K}{\tau^2 s^2 + 2\tau \xi s + 1}.
\end{equation}
```
"

# ╔═╡ ab0b03d2-1cc6-4282-bb71-5eb1478a18dd
html"<img src=\"https://raw.githubusercontent.com/SimonEnsemble/CHE_361_W2022/main/studios/so_system.png\" width=300>"

# ╔═╡ 1a19082e-7e4e-4b9e-8eee-94201ffb5a37
md"

in this studio, we'll examine how the poles, damping coefficient $\xi$, and time constant $\tau$ affect the step response of a SO system by comparing the step responses of two pairs of SO systems.

**credits:** thanks Dr. Trevor Carlisle for developing this studio.

!!! note
	see the `Controlz.jl` [docs](https://simonensemble.github.io/Controlz.jl/dev/tfs/#(0,-2)-order-transfer-functions-1) for handy functions to deal with second-order transfer functions.

## juxtaposing $G_1(s)$ and $G_2(s)$

let's compare the following two second-order transfer functions:

```math
\begin{equation}
    G_1(s)=\frac{4}{80 s ^ 2 + 10s + 5}
\end{equation}
```

```math
\begin{equation}
    G_2(s)=\frac{4}{80 s ^ 2 + 40s + 5}
\end{equation}
```

🌵 for each transfer function, on pencil and paper, *without using `Controlz.jl`*, determine the gain, time constant, damping coefficient, and poles of the two transfer functions. write your answers in the markdown cell below.
"

# ╔═╡ e5926904-9346-4ecc-8a62-12bfe8c64c0b
md"
#### $G_1(s)$
the gain $K={\color{red} ?}$

the time constant $\tau={\color{red} ?}$

the damping coefficient $\xi={\color{red} ?}$

the poles are: 
*  $p_+={\color{red} ?}$
*  $p_-={\color{red} ?}$

#### $G_2(s)$
the gain $K={\color{red} ?}$

the time constant $\tau={\color{red} ?}$

the damping coefficient $\xi={\color{red} ?}$

the poles are: 
*  $p_+={\color{red} ?}$
*  $p_-={\color{red} ?}$
"

# ╔═╡ 20a84670-3859-4088-bffa-2cd24357fa6c
md"🌵 now, use `Controlz.jl` to corroborate (or revise!) your answers above:
* construct the transfer functions and assign them as variables `g₁` and `g₂`
* compute the zeros, poles, and gain with `zeros_poles_gain`. see [docs](https://simonensemble.github.io/Controlz.jl/dev/tfs/#poles,-zeros,-and-zero-frequency-gain-of-a-transfer-function-1).
* compute the time constant $\tau$ and damping coefficient $\xi$ using `time_constant` and`damping_coefficient`. see [docs](https://simonensemble.github.io/Controlz.jl/dev/tfs/#(0,-2)-order-transfer-functions-1).
"

# ╔═╡ d8d83567-e202-424e-96c2-9d60139f6bd1
# construct g₁

# ╔═╡ a4a2dc5c-cb65-4922-90a3-bd43538accdc
# construct g₂

# ╔═╡ 8003042d-4ac0-4810-a1e4-5563fe0656bb
# compute the zeros, poles, and gain of g₁

# ╔═╡ be8e3d03-c249-4527-844e-1463d161e839
# compute the zeros, poles, and gain of g₂

# ╔═╡ 9c427e3b-f5ad-442c-8f5f-3998b011680a
# compute τ and ξ of g₁

# ╔═╡ 019f853e-abe2-4529-bcff-8cb88b48cafc
# compute τ and ξ of g₂

# ╔═╡ 5d31b350-6666-4014-9720-0a8749901311
md"🌵 use the `viz_poles` function I've provided below to plot the poles of the two transfer functions _on the same plot_, but with different colors. the labels are needed to indicate which markers correspond to which transfer function.

!!! note
	💡 it's a good idea to draw the poles of the two transfer functions and their step responses on the _same_ plot to facilitate comparison.
"

# ╔═╡ 0a4b7db9-270d-47e8-85b8-78e66e5eab1d
function viz_poles(poles_a::Vector, poles_b::Vector, 
	               label_a::String, label_b::String)
	fig = Figure()
	# create complex plane
	ax  = Axis(fig[1, 1], xlabel="Re", ylabel="Im", title="poles")
	hlines!(ax, 0.0, color="lightgray")
	vlines!(ax, 0.0, color="lightgray")
	# draw first list of poles
	scatter!(
		real.(poles_a), imag.(poles_a), 
		marker=:x, markersize=18, label=label_a
	)
	# draw second list of poles
	scatter!(
		real.(poles_b), imag.(poles_b), 
		marker=:x, markersize=18, label=label_b
	)
	# draw a legend
	axislegend(position=:lt)
	fig
end

# ╔═╡ d06e70df-4ea0-4edd-a39b-0d3315955104
# viz the poles of two transfer functions on the same plot.

# ╔═╡ 59bdcf8a-a3e2-4e4c-a593-989d6d284cd2
md"🌵 for both system 1 and system 2, answer the following questions.
* is the system overdamped, critically damped, or underdamped? 
"

# ╔═╡ 2159b613-2207-4a31-9841-a9219704d7ba
md"

_system 1_, described by $G_1(s)$ is _XXXX_.

_system 2_, described by $G_2(s)$: is _XXXX_.
"

# ╔═╡ 3559330f-4b20-44ff-a3ca-2c08d370ea3c
md"🌵 for both $G_1(s)$ and $G_2(s)$, use `Controlz.jl` to simulate the response to a unit step input for $t \in [0, 80]$. see [docs](https://simonensemble.github.io/Controlz.jl/dev/sim/#response-of-an-underdamped-second-order-system-to-a-unit-step-input-1). plot *both* reponses on the same plot. again, I wrote a function below to help you.
"

# ╔═╡ f3e61cf5-1dfd-4928-8f2d-f865284fe9b9
function viz_responses(data_a::DataFrame, data_b::DataFrame, 
	                   label_a::String, label_b::String)
	fig = Figure()
	ax  = Axis(fig[1, 1], xlabel="time, t", ylabel="output yᵢ*(t)")
	# draw step responses
	lines!(data_a[:, "t"], data_a[:, "output"], label=label_a)
	lines!(data_b[:, "t"], data_b[:, "output"], label=label_b)
	axislegend()
	fig
end

# ╔═╡ 96e930c0-f303-44e2-b6f7-478373e01e31


# ╔═╡ 4cc8fc51-21e7-455d-bda2-59064ed0593e
md"🌵 compare the
* presence or absence of oscillations
* time scale of the response, judged by the time for the output to _first reach_, say, 95% of the new steady state
of the step response between the two systems. how is this explained by a comparison of the
* location of the poles in the complex plane
* values of $\tau$ and $\xi$
for these systems?

what is the take-home message from this comparison, in terms of the damping coefficient $\xi$?
"

# ╔═╡ 2465e727-3916-4541-be7d-0378d7f42ff6
md"

"

# ╔═╡ 974f2b7e-0bf3-4fbd-bd55-9bf8094553c0
md"## juxtaposing $G_3(s)$ and $G_4(s)$

let's compare the following two second-order transfer functions:

```math
\begin{equation}
    G_3(s)=\frac{5}{9s^2+7.2s+1}
\end{equation}
```
```math
\begin{equation}
    G_4(s)=\frac{5}{16s^2+9.6s+1}
\end{equation}
```

🌵 for each transfer function, use `Controlz.jl` to:
* construct the transfer functions and assign them as variables `g₃` and `g₄`
* compute the zeros, poles, and gain with `zeros_poles_gain`. 
* compute the time constant $\tau$ and damping coefficient $\xi$ using `time_constant` and`damping_coefficient`. 
"

# ╔═╡ 779b5844-4da7-4865-8e70-b24cc6d21ab1
# construct the transfer function g₃

# ╔═╡ 452959eb-af2a-4bf1-8c4d-71eb60ddbde9
# construct the transfer function g₄

# ╔═╡ 5ca596c0-bc0b-443b-a626-925fcbdbbb46
# compute the zeros, poles, and gain of the transfer function g₃

# ╔═╡ 4638cb02-899d-4b7c-b901-29d08f22b23e
# compute the zeros, poles, and gain of the transfer function g₄

# ╔═╡ ac618843-469c-4b4c-8325-af5a24fdbc2d
# compute τ and ξ of transfer function g₃

# ╔═╡ dcb61cf4-04f8-4b16-a320-f29944041cd3
# compute τ and ξ of transfer function g₄

# ╔═╡ c8fc6314-25c1-4c25-a994-df7bbdec20a4
md"🌵 again, use the `viz_poles` function I've provided to plot the poles of the two transfer functions _on the same plot_."

# ╔═╡ 8484ea8a-6e85-41cc-a2f5-4210e80973f5


# ╔═╡ 2a6f3e3c-a3a1-4116-afac-c8edb9fe93a2
md"🌵 for both system 3 and system 4, answer the following questions.
* is the system overdamped, critically damped, or underdamped? 
"

# ╔═╡ aff6b663-61a1-4d7a-aea5-12333f8ed71a
md"

_system 3_, described by $G_3(s)$ is _XXXX_.

_system 4_, described by $G_4(s)$ is _XXXX_.
"

# ╔═╡ 5cf7da8a-011c-414e-b2e3-836fe99bc523
md"🌵 for both $G_3(s)$ and $G_4(s)$, use `Controlz.jl` to simulate the response to a unit step input for $t \in [0, 60]$. plot *both* reponses on the same plot using `viz_responses` I provided above.
"

# ╔═╡ 04675aae-3c91-4a73-b737-a14c1ed47f4b


# ╔═╡ c8b891cd-c715-4711-b6a1-e5765ede27f8
md"🌵 compare the
* presence or absence of oscillations
* time scale of the response, judged by the time for the output to _first reach_, say, 95% of the new steady state
of the step response between the two systems. how is this explained by a comparison of the
* location of the poles in the complex plane
* values of $\tau$ and $\xi$
for these systems?

what is the take-home message from this comparison, in terms of the time constant $\tau$?
"

# ╔═╡ d094e4ab-accf-40e4-a4d2-a186239cc084
md"

"

# ╔═╡ b480cb3f-44b6-48dd-858b-03da295beab8
md"## visualizing how $\xi$ affects the step response of a second order system

🌵 write a `for` loop to simulate the unit step response to 

```math
\begin{equation}
    G(s)=\frac{4}{80 s ^ 2 + 40\xi s + 5}
\end{equation}
```
for $\xi = [0.2, 0.4, 0.6, 0.8, 1.0]$ and plot the responses on the same plot. do not copy and paste a line of code 5 times; instead, use a for loop over $\xi$'s for constructing the transfer function, simulating the response for $t\in[0,80]$, and plotting the curves. use a legend to label which $\xi$ each output response curve corresponds to.

_ambitious Beavers_: use `ColorSchemes.jl` to intelligently color the curve according to the value of $\xi$ with a colormap. see [here](https://juliagraphics.github.io/ColorSchemes.jl/stable/basics/#ColorScheme-objects).
!!! hint
	pass `label=\"ξ = $ξ\"` to `lines!()`. this string-formats the variable `ξ`.
"

# ╔═╡ 8ee74b68-80ba-476d-b865-bc9d58918af1
get(ColorSchemes.turbid, 0.25)

# ╔═╡ Cell order:
# ╠═9c577493-dcb3-42a1-a4e2-3dd441038633
# ╠═14c3b290-2eaf-423c-9305-1fa146deac10
# ╟─9bd7f8bc-902b-11ec-32fd-8d5830e04421
# ╟─ab0b03d2-1cc6-4282-bb71-5eb1478a18dd
# ╟─1a19082e-7e4e-4b9e-8eee-94201ffb5a37
# ╟─e5926904-9346-4ecc-8a62-12bfe8c64c0b
# ╟─20a84670-3859-4088-bffa-2cd24357fa6c
# ╠═d8d83567-e202-424e-96c2-9d60139f6bd1
# ╠═a4a2dc5c-cb65-4922-90a3-bd43538accdc
# ╠═8003042d-4ac0-4810-a1e4-5563fe0656bb
# ╠═be8e3d03-c249-4527-844e-1463d161e839
# ╠═9c427e3b-f5ad-442c-8f5f-3998b011680a
# ╠═019f853e-abe2-4529-bcff-8cb88b48cafc
# ╟─5d31b350-6666-4014-9720-0a8749901311
# ╠═0a4b7db9-270d-47e8-85b8-78e66e5eab1d
# ╠═d06e70df-4ea0-4edd-a39b-0d3315955104
# ╟─59bdcf8a-a3e2-4e4c-a593-989d6d284cd2
# ╠═2159b613-2207-4a31-9841-a9219704d7ba
# ╟─3559330f-4b20-44ff-a3ca-2c08d370ea3c
# ╠═f3e61cf5-1dfd-4928-8f2d-f865284fe9b9
# ╠═96e930c0-f303-44e2-b6f7-478373e01e31
# ╟─4cc8fc51-21e7-455d-bda2-59064ed0593e
# ╠═2465e727-3916-4541-be7d-0378d7f42ff6
# ╟─974f2b7e-0bf3-4fbd-bd55-9bf8094553c0
# ╠═779b5844-4da7-4865-8e70-b24cc6d21ab1
# ╠═452959eb-af2a-4bf1-8c4d-71eb60ddbde9
# ╠═5ca596c0-bc0b-443b-a626-925fcbdbbb46
# ╠═4638cb02-899d-4b7c-b901-29d08f22b23e
# ╠═ac618843-469c-4b4c-8325-af5a24fdbc2d
# ╠═dcb61cf4-04f8-4b16-a320-f29944041cd3
# ╟─c8fc6314-25c1-4c25-a994-df7bbdec20a4
# ╠═8484ea8a-6e85-41cc-a2f5-4210e80973f5
# ╟─2a6f3e3c-a3a1-4116-afac-c8edb9fe93a2
# ╠═aff6b663-61a1-4d7a-aea5-12333f8ed71a
# ╟─5cf7da8a-011c-414e-b2e3-836fe99bc523
# ╠═04675aae-3c91-4a73-b737-a14c1ed47f4b
# ╟─c8b891cd-c715-4711-b6a1-e5765ede27f8
# ╠═d094e4ab-accf-40e4-a4d2-a186239cc084
# ╟─b480cb3f-44b6-48dd-858b-03da295beab8
# ╠═8ee74b68-80ba-476d-b865-bc9d58918af1
