### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ 9d8d06a4-8ab9-11ec-3a47-e1d146b64196
begin
    import Pkg; Pkg.activate()
    using Controlz, CairoMakie
end

# ╔═╡ 9350f586-19ef-43ea-97ac-c6c14754ea2e
set_theme!(Controlz.cool_theme)

# ╔═╡ f982d085-8a26-4bd1-8260-a116d26b25da
md"
# two first order processes in series

a drug is ingested. it absorbs into the blood through the GI tract. it decays in the blood. this can be viewed as two first order processes in series. a model for the dynamics of the drug concentration in the human body (GI tract, blood) is:

```math
  \begin{align}
      V_g \frac{dg}{dt} &= i(t) - \beta V_g g(t) \\
      V_b\frac{db}{dt} &= \beta V_g g(t) - \alpha V_b b(t)
  \end{align}
```

input:
*  $i(t)$: rate at which the drug is ingested

outputs:
*  $g(t)$: concentration of drug in GI tract
*  $b(t)$: concentration of drug in blood

(constant) parameters:
*  $V_g$: volume of fluid in the GI tract
*  $V_b$: volume of blood
*  $\beta$: rate constant for absorption of drug into blood from GI tract
*  $\alpha$: rate constant for decay of the drug in the blood
(see the written portion of the studio...)
"

# ╔═╡ 02c3e61c-36da-414a-8cd0-0b557473ca72
html"<img src=\"https://upload.wikimedia.org/wikipedia/commons/c/c5/Digestive_system_diagram_en.svg\" alt=\"drawing\" width=\"250\" align=\"middle\"/>"

# ╔═╡ ea22e0bd-c1e2-4e1d-bba5-42bdf3004862
md"!!! note
	docs for `Controlz.jl` are [here](https://simonensemble.github.io/Controlz.jl/dev/).
"

# ╔═╡ 1f6513d6-f2dd-4235-aaff-008b2d273284

md"
🍕 suppose the parameters governing the dynamics of the drug absorption/decay in a particular patient are:
*   $\alpha=1/6$ hr$^{-1}$
*   $\beta = 1/4$ hr$^{-1}$
*   $V_b=V_g=1$ L

declare them as variables in Julia below.
"

# ╔═╡ f7afdf4a-59e5-4425-b16e-0c25ea01f37b


# ╔═╡ 0a21fe3f-98cc-4bb1-a4f2-a1622a09027f
md"🍕 use `Controlz.jl` to contruct and assign to a variable: the transfer function giving the output $G(s)$ in response to the input $I(s)$.

!!! hint
	an informative variable name might be `G_ig`.
"

# ╔═╡ 2a548f3c-f0ec-4782-8f90-59661d982f82
html"
<img src=\"https://devhumor.com/content/uploads/images/May2018/meaningful_variable_name.jpg\" width=250></img>"

# ╔═╡ fffc16fe-d734-42b3-96d9-934d9803e29d


# ╔═╡ 454e3a9d-99ac-4301-a935-0e670391b357
md"🍕 now contruct and assign to a variable: the transfer function that gives the output $B(s)$ in response to the input $G(s)$."

# ╔═╡ 21b6a29f-80e4-4ea1-9655-1e3d62817447


# ╔═╡ 93f53302-743b-49ff-a057-2b4cf651ab0b
md"🍕 finally, construct and assign to a variable: the \"composite\"/\"overall\" transfer function that gives the output $B(s)$ in response to the input $I(s)$.

!!! hint
	use your two previously defined transfer functions, and let `Controlz.jl` do the transfer function algebra for you. see [here](https://simonensemble.github.io/Controlz.jl/dev/tfs/#transfer-function-algebra). this might be a good way to check your algebra in your write-up, too.
"

# ╔═╡ 83649ac9-71c2-41a7-b8c5-d434acd1eef1


# ╔═╡ 87c861ad-2c74-4f47-8bf2-19f21244409c
md"🍕 visualize the poles of the second order \"overall\" transfer function $B(s)/I(s)$ in the complex plane. are the poles real? do the poles have imaginary parts? are the real parts of the poles negative? etc.

!!! hint
	use `viz_poles_and_zeros`. see [here](https://simonensemble.github.io/Controlz.jl/dev/viz/#poles-and-zeros-of-a-transfer-function).
"

# ╔═╡ 95de043e-f0ef-4415-af71-178fa3abcf74


# ╔═╡ f3d2b651-1e15-48b8-9028-d0cec39e362a
md"🍕 swallowing a pill of $A$ mg of a drug at $t=0$ can be modeled as an impulse input $i(t)=A \delta(t)$, with $\delta(t)$ the Dirac delta function. 

in `Controlz.jl`, simulate the response $b(t)$ to this pill-swallowing input if $A=3$ mg. 
* simulate for $t \in [0, 36]$ hr
* include x- and y-axis labels with units
"

# ╔═╡ abdb63cf-23bd-4bec-a8ef-f0db4797597b


# ╔═╡ c6f232f6-af05-4d87-a5ec-a4086291605c


# ╔═╡ c0aff31d-5c13-4532-a2f2-4d79f5cb3a7b


# ╔═╡ 7b847acf-b596-4057-8e78-9dc0963cf469
md"🍕 discuss with your neighbor: why is the curve shaped this way? explain what is happening here."

# ╔═╡ 0a48c8f4-a566-411d-bcea-a2e67459c2a8
md"

👽these questions illustrate why modeling pharmokinetics is practically useful. 👽

🍕 what is the peak concentration of the drug in the blood stream? think of why this would be important to know. do not eyeball the figure; rather use Julia to query the data frame returned by `simulate`. 

!!! hint
	use Julia's `maximum` function.
"

# ╔═╡ 436f982e-7ba2-41a1-be96-d5ba9802842b


# ╔═╡ 06c37e1c-8695-45c4-9ed6-afcfbb77aa38
md"🍕 when (at what time $t$) does the peak blood concentration occur? again, use code to answer this question. 

!!! hint
	use Julia's `argmax` function.
"

# ╔═╡ cb91bd9a-ae1b-44a8-8bf5-3e0665837dea


# ╔═╡ b2295e09-22cf-428c-9b19-aed787e3a1b3
md"🍕 the drug is ineffective if its concentration in the blood is less than 0.6 mg/L.

1. how many hours does it take for the drug to be effective?
2. for how much time is the drug effective?

ie. find the time window during which the drug is effective.

this is a programming exercise; do not eyeball the figure to get the answer...

!!! hint
	two approaches are: (1) `findfirst` and `findlast`, (2) a `for` loop.
	"

# ╔═╡ 72d898a2-ae1c-480a-9b02-58c75ee34536


# ╔═╡ 4fb37ad7-80b7-4e7d-a3fe-1ffdb91c656a


# ╔═╡ 70c65b2d-606d-415b-8593-6cea550d2b04
md"🍕 redraw the impulse response but this time add a vertical span to highlight the time interval that the drug is effective. does your answer look reasonable?

!!! hint
	use `vspan!` [here](https://docs.makie.org/stable/reference/plots/hvspan/index.html#vspan) and apply this to the figure returned from `viz_response` via [here](https://simonensemble.github.io/Controlz.jl/dev/viz/#modifying-the-figures).
"

# ╔═╡ ed6d37bb-abdf-4673-ae72-cbcdb30de58b


# ╔═╡ Cell order:
# ╠═9d8d06a4-8ab9-11ec-3a47-e1d146b64196
# ╠═9350f586-19ef-43ea-97ac-c6c14754ea2e
# ╟─f982d085-8a26-4bd1-8260-a116d26b25da
# ╟─02c3e61c-36da-414a-8cd0-0b557473ca72
# ╟─ea22e0bd-c1e2-4e1d-bba5-42bdf3004862
# ╟─1f6513d6-f2dd-4235-aaff-008b2d273284
# ╠═f7afdf4a-59e5-4425-b16e-0c25ea01f37b
# ╟─0a21fe3f-98cc-4bb1-a4f2-a1622a09027f
# ╟─2a548f3c-f0ec-4782-8f90-59661d982f82
# ╠═fffc16fe-d734-42b3-96d9-934d9803e29d
# ╟─454e3a9d-99ac-4301-a935-0e670391b357
# ╠═21b6a29f-80e4-4ea1-9655-1e3d62817447
# ╟─93f53302-743b-49ff-a057-2b4cf651ab0b
# ╠═83649ac9-71c2-41a7-b8c5-d434acd1eef1
# ╟─87c861ad-2c74-4f47-8bf2-19f21244409c
# ╠═95de043e-f0ef-4415-af71-178fa3abcf74
# ╟─f3d2b651-1e15-48b8-9028-d0cec39e362a
# ╠═abdb63cf-23bd-4bec-a8ef-f0db4797597b
# ╠═c6f232f6-af05-4d87-a5ec-a4086291605c
# ╠═c0aff31d-5c13-4532-a2f2-4d79f5cb3a7b
# ╟─7b847acf-b596-4057-8e78-9dc0963cf469
# ╟─0a48c8f4-a566-411d-bcea-a2e67459c2a8
# ╠═436f982e-7ba2-41a1-be96-d5ba9802842b
# ╟─06c37e1c-8695-45c4-9ed6-afcfbb77aa38
# ╠═cb91bd9a-ae1b-44a8-8bf5-3e0665837dea
# ╟─b2295e09-22cf-428c-9b19-aed787e3a1b3
# ╠═72d898a2-ae1c-480a-9b02-58c75ee34536
# ╠═4fb37ad7-80b7-4e7d-a3fe-1ffdb91c656a
# ╟─70c65b2d-606d-415b-8593-6cea550d2b04
# ╠═ed6d37bb-abdf-4673-ae72-cbcdb30de58b
