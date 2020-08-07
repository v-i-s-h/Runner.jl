# This script  will be called from runtests.jl as
#   ./argparse.jl 33 9
using ArgParse

parser = ArgParseSettings()
@add_arg_table! parser begin
    "--num1"
        help = "First number"
        arg_type = Int
        default = 33
    "--num2"
        help = "Second number"
        arg_type = Int
        default = 42
    "--ans"
        help = "Answer to check"
        arg_type = Int
        default = 75
end

@testset "ArgParseTest" begin
    parsed_args = parse_args(parser)
    ans = parsed_args["num1"] + parsed_args["num2"]

    @test ans == parsed_args["ans"]
end
