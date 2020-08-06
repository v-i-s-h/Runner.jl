using Runner
using Test

@testset "Runner.jl" begin
    # run simple argument
    # @run "./simplesum.jl 12 13"
    include("./simplesum.jl")
end
