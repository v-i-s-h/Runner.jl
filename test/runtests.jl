module RunnerTests

using Runner
using Test

# Re-include the packages so that later scripts will not throw the Undefined
# error
@run "common.jl"

# run simple argument
@run "./simplesum.jl 12 13 25"

# examples with ArgParse 
@run "./argparsesum.jl"
@run "./argparsesum.jl --num1 33 --num2 9 --ans 42"
@run "./argparsesum.jl --num1 0 --ans 42"

end