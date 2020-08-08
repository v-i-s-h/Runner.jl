module RunnerTests

using Runner
using Test

# Re-include the packages so that later scripts will not throw the Undefined
# error
@runit "common.jl"

# run simple argument
@runit "./simplesum.jl 12 13 25"
@runit "./simplesum.jl 12   23    35"  # run with extra space

# examples with ArgParse 
@runit "argparsesum.jl"
@runit "argparsesum.jl --num1 33 --num2 9 --ans 42"
@runit "argparsesum.jl --num1 0 --ans 42"

end
