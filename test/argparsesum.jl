using ArgParse

parser = ArgParseSettings()
@add_arg_table parser begin
    "--num1"
        help = "First number"
        arg_type = Int
        default = 33
    "--num2"
        help = "Seond number"
        arg_type = Int
        default = 42
end

parsed_args = parse_args(parser)
parsed_args.num1 + parsed_args.num2