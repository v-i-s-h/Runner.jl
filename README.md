# Runner.jl

**TL;DR** Provides `@runit` macro for running scripts with commandline arguments from REPL.
Instead of
````
$julia script.jl arg1 arg2 arg3
````
use, from REPL
```
julia> @runit "script.jl arg1 arg2 arg3"
```

**Advantage**: Avoid the delay in package load times during development. Load it once using REPL and continue using it with commandline arguments.

## Why?
This packages tries to solve the problem of running scripts with commandline arguments from REPL. Often we write scripts that can be called from commandline with arguments like
```
$julia script.jl arg1 arg2 arg3
```
However, during development, this may become cumbersome. If we use some packages which has long load times, running the script as above will create long delays before actually executing the code. A faster approach during development is to start a REPL and use
```
julia> include('script.jl')
```
But, in this case, we will not be able to provide command line arguments. Work around is to define a function which takes in arguments and manually calling it. Not neat!

This package exists to overcome this difficulty. It provide a macro `@runit` which will let you run script from REPL with commandline arguments.

## How?
### Simple use case
If you have a script like
```
# hello.jl
# Simple script for demo. Accesses ARGS
println("Hello $(ARGS[1])!")
```
From commadline, we can run this as
```
$julia hello.jl Julia
```
To run this from REPL, use
```
julia> @runit hello.jl Julia
```

### Use with `ArgParse`
```
# Script hello2.jl
using ArgParse

parser = ArgParseSettings()
@add_arg_table! parser begin
    "name"
	    help = "Name to greet"
  	    arg_type = String
    "--greet"
        help = "Greeting sting"
        arg_type = String
        default = "Hello"
end

parsed_args = parse_args(parser)

println(parsed_args["greet"], " ", parsed_args["name"], "!")
```
From commandline
```
$julia hello2.jl Julia
Hello Julia!

$julia hello2.jl Julia --greet Namaste
Namaste Julia!
```
From REPL
```
julia> @runit "hello2.jl Julia"
Hello Julia!

julia> @runit "hello2.jl Julia --greet Namaste"
Namaste Julia!
```