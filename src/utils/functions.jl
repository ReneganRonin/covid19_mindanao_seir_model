# Packages
using ModelingToolkit, DifferentialEquations, Symbolics, Parameters, Random, Statistics

"""
    create_model()

Creates a model using `DifferentialEquations` and `ModelingToolkit`
"""
function create_model(;algo=SOSRI())
    @parameters t γ R̄₀ η σ ξ θ δ_bar
    @variables s(t) i(t) r(t) d(t) R₀(t) δ(t)

    p_gen = @with_kw (
    T=550.0, N=3.3E8, γ=1.0 / 18, R̄₀=1.6, σ=0.03, ξ=0.004, θ=0.2, δ_bar=0.01, η=1.0 / 20
    )
    p = p_gen()

    D = Differential(t)
    eqs = [
        D(s) ~ -γ * R₀ * s * i,
        D(i) ~ γ * R₀ * s * i - γ * i,
        D(r) ~ (1 - δ) * γ * i,
        D(d) ~ δ * γ * i,
        D(R₀) ~ η * (R̄₀ - R₀),
        D(δ) ~ θ * (δ_bar - δ),
    ]

    noiseeqs = [0.0 * s, 0.0 * i, 0.0 * r, 0.0 * d, σ * sqrt(R₀), ξ * sqrt(δ * (1 - δ))]

    sys = SDESystem(eqs, noiseeqs, t, [s, i, r, d, R₀, δ], [γ, R̄₀, η, σ, ξ, θ, δ_bar])

    u0 = [
        s => 1.0 - i - r - d,
        i => 25000 / p.N,
        r => 0.0,
        d => 0.0,
        R₀ => 0.5,
        δ => p.δ_bar,
    ]
    tspan = (0.0, p.T) # the initial timespan for now

    # going to use some random values for now
    p0 = [
        γ => p.γ, ξ => p.ξ, θ => p.θ, R̄₀ => p.R̄₀, δ_bar => p.δ_bar, σ => p.σ, η => p.η
    ]

    prob = SDEProblem(sys, u0, tspan, p0)
    return solve(prob, algo)
end
