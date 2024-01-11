### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 64d5b078-6eb1-11ec-290d-99aa7b5ace54
begin
	# to use your global package installations, instead of specific to this notebook
	import Pkg; Pkg.activate() 
	
	# packages we'll use here.
	using CairoMakie, DataFrames, ColorSchemes, Colors, PlutoUI
	import CSV.read
	
	# modifying the plot scheme
	set_theme!(theme_light())
	update_theme!(fontsize=20)
end

# ╔═╡ edbcad9f-bbc8-44c9-9165-ce61ee6671c3
md"# Julia bootcamp

**learning objective:** 
* familiarize with some capabilities of the Julia programming language and Pluto notebooks.

> 🔥 computational skills, incl. numerical methods, working with and visualizing data, and implementing simple computer programs, are important for a modern chemical engineer. -Cory 

❓ how do I figure out how to code something up in Julia?
* Julia [docs](https://docs.julialang.org/en/v1/)
* package-specific docs
  * `CSV` package [docs](https://csv.juliadata.org/stable/index.html)
  * `CairoMakie` package [docs](https://makie.juliaplots.org/dev/)
  * `DataFrames` package [docs](https://dataframes.juliadata.org/stable/)
* Google-search \"how do I ... in Julia?\"
* ChatGPT
"

# ╔═╡ 10ef6326-b3c3-44aa-8496-9c6bedfde875
TableOfContents()

# ╔═╡ a9b9a51b-f129-4d45-8b5c-f427296a3660
md"
## Fibonacci sequence

🐸 construct an array of length 100, containing the first 35 numbers of the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_number). of course, *write a program* to compute the numbers and fill the array, as opposed to manually constructing an array with 35 entries.

!!! hint
	write a `for` loop.

!!! example \"relevant docs\"
	* [arrays](https://docs.julialang.org/en/v1/manual/arrays/)
	* [for loops](https://docs.julialang.org/en/v1/manual/control-flow/#man-loops)
"

# ╔═╡ 04062259-b30a-47df-b6e7-b39b7ccff01d


# ╔═╡ edcac259-402e-45ae-a0a3-c662f0bb842c
md"
## plotting a function

🐸 plot (as a curve) the function $y(t)=e^{-t}\sin(10 t)$ over the domain $t\in[0, 6]$. include an x- and y-axis label on your plot. make sure you have enough resolution in your `t` array so that the plot appears smooth. do this by using the `range` function to make a dense array of equally-spaced $t$-values, then compute $y(t)$ at each of these values, storing them in an array. write a function `y(t)` for this task.

!!! example \"relevant docs\"
	* [line plot](https://docs.makie.org/stable/tutorials/basic-tutorial/#adding_a_plot_to_an_axis)
	* [range constructor](https://docs.julialang.org/en/v1/base/math/#Base.range)
	* [sine function](https://docs.julialang.org/en/v1/base/math/#Base.sin-Tuple{Number})
	* [dot syntax](https://docs.julialang.org/en/v1/manual/functions/#man-vectorized) or [comprehensions](https://docs.julialang.org/en/v1/manual/arrays/#man-comprehensions)
	* [functions](https://docs.julialang.org/en/v1/manual/functions/)
"

# ╔═╡ 5f04bb82-5d64-435c-8d0d-e6c439639329


# ╔═╡ c0fd10de-0190-4efb-a5ef-89ee08d5fa6c
md"## reading in, plotting data

🐸 download the data set (CSV format) giving the monthly mean CO₂ concentration measured in Mauna Loa from the NOAA [here](https://gml.noaa.gov/ccgg/trends/). read in the data as a `DataFrame` in Julia using the `CSV.read` function. plot the measured CO₂ concentration over time with a green line. include x- and y-axis labels with units.

!!! hint
	look at the raw `.csv` file. the first few lines are comments. use the `comment` keyword argument of the `CSV.read` function to ignore these lines when reading in the file.

!!! example \"relevant docs\"
	* [readdir](https://docs.julialang.org/en/v1/base/file/#Base.Filesystem.readdir)
	* [pwd](https://docs.julialang.org/en/v1/base/file/#Base.Filesystem.pwd)
	* [reading in a CSV](https://csv.juliadata.org/stable/reading.html#CSV.read)
	* [indexing columns of a DataFrame](https://dataframes.juliadata.org/stable/man/basics/#Indexing-Syntax)
	* [line plot](https://docs.makie.org/stable/reference/plots/lines/)
"

# ╔═╡ 08ab9417-f332-4599-a415-e8c710c1ff5b
pwd()

# ╔═╡ 48b6c472-0001-40b2-a0a4-61f1aa906252
readdir()

# ╔═╡ bafac1f9-537c-4c58-ab28-20784891ae8e


# ╔═╡ f5692d5e-e9cf-40e6-856c-1acfbf11ef28


# ╔═╡ dbee0556-c275-47df-85a5-1a3899b91002
md"_ambitious Beavers_: what causes the oscillations with a period of one year?"

# ╔═╡ d18ec2aa-ca32-49f9-9a5a-470214d995f5
md"## writing your own function

the sine function is sometimes *defined* in terms of the infinite series [^1]:

$\sin(x):=\displaystyle\sum_{n=0}^\infty \frac{(-1)^n}{(2n+1)!} x^{2n+1}$

on the computer, we can compute the truncated sum as an approximation:

$\sin(x) \approx \displaystyle\sum_{n=0}^{N-1} \frac{(-1)^n}{(2n+1)!} x^{2n+1}$

the approximation gets better as `N` increases.

🐸 write a function `my_sin(x, N)` that uses `N` terms to compute the truncated sum approximating the sine function for $x=$`x` and return (output) the value of the sum.

!!! example \"relevant docs\"
	* [factorial](https://docs.julialang.org/en/v1/base/math/#Base.factorial)
	* [functions](https://docs.julialang.org/en/v1/manual/functions/)

[^1] source: [Wikipedia](https://en.wikipedia.org/wiki/Sine_and_cosine#Series_definitions)
"

# ╔═╡ 00f0b5c6-bd5d-435d-932d-926769f14293


# ╔═╡ e1e9c3b8-57a9-4b7f-9622-48ab2ba731b5
md"
🐸 compare $\sin(1)$ computed with:
* Julia's implementation of the sine function, `sin`
* your truncated sum approximation of the sine function, with `N=4` terms, using `my_sin`

!!! hint
	they should be close.
"

# ╔═╡ 01d4446c-2cc3-4c5b-ab8e-6e9df25294c7
# my sine function

# ╔═╡ 4cddd124-0eae-45c7-96f3-23e3e53a0613
# Julia's built-in sine function

# ╔═╡ 9852fdaa-7c86-4e88-96af-6ec273222dd4
md"
let's make the same comparison, but over many more $x$ values.

🐸 on the same plot panel, draw _two_ curves approximating $\sin(x)$ over the domain $x\in[0, 2\pi]$ using:
* Julia's implementation, `sin` [solid line]
* your truncated sum implementation with `N` terms, `my_sin` [dashed line, different color]
use a legend to indicate which line corresponds to which implementation. use a dashed line for one of them. label your x- and y-axes, and indicate the value of N somewhere in the plot (eg. via `title` or `label`).

start with `N=4`. increase `N` by one until your truncated sum approximation is visually indistinguishable from Julia's implementation over the domain [0, 2π].

!!! example \"relevant docs\"
	* [axislegend](https://docs.makie.org/stable/tutorials/basic-tutorial/#simple_legend)
"

# ╔═╡ b89f1624-d2b5-4262-bcd5-514446dd66f6


# ╔═╡ Cell order:
# ╟─edbcad9f-bbc8-44c9-9165-ce61ee6671c3
# ╠═64d5b078-6eb1-11ec-290d-99aa7b5ace54
# ╠═10ef6326-b3c3-44aa-8496-9c6bedfde875
# ╟─a9b9a51b-f129-4d45-8b5c-f427296a3660
# ╠═04062259-b30a-47df-b6e7-b39b7ccff01d
# ╟─edcac259-402e-45ae-a0a3-c662f0bb842c
# ╠═5f04bb82-5d64-435c-8d0d-e6c439639329
# ╟─c0fd10de-0190-4efb-a5ef-89ee08d5fa6c
# ╠═08ab9417-f332-4599-a415-e8c710c1ff5b
# ╠═48b6c472-0001-40b2-a0a4-61f1aa906252
# ╠═bafac1f9-537c-4c58-ab28-20784891ae8e
# ╠═f5692d5e-e9cf-40e6-856c-1acfbf11ef28
# ╟─dbee0556-c275-47df-85a5-1a3899b91002
# ╟─d18ec2aa-ca32-49f9-9a5a-470214d995f5
# ╠═00f0b5c6-bd5d-435d-932d-926769f14293
# ╟─e1e9c3b8-57a9-4b7f-9622-48ab2ba731b5
# ╠═01d4446c-2cc3-4c5b-ab8e-6e9df25294c7
# ╠═4cddd124-0eae-45c7-96f3-23e3e53a0613
# ╟─9852fdaa-7c86-4e88-96af-6ec273222dd4
# ╠═b89f1624-d2b5-4262-bcd5-514446dd66f6
