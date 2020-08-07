# This script should be called from runtests.jl as
#   ./simplesum.jl 12 13 25

@testset "Basic" begin
    ans = parse(Int64, ARGS[1]) + parse(Int64, ARGS[2])
    @test ans == parse(Int64, ARGS[3])
end