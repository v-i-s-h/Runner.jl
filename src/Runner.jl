module Runner

export @runit

"""

"""
macro runit(command::String)
    # find the filename to include
    # TODO: Remove multiple and trailing whitespaces
    args_list = split(command)
    inc_file = popfirst!(args_list)

    # check if args need to be modified
    _ARGS = [] # to backup existing ARGS
    if length(args_list) > 0
        _ARGS = [ popfirst!(ARGS) for i ∈ 1:length(ARGS) ]
        for a in args_list
            push!(ARGS, string(a))
        end
    end

    # include/run the script
    include(inc_file)

    # replace orginal contents of ARGS
    # delete current contents of ARGS
    # TODO: Is there a better way to do this?
    [ pop!(ARGS) for i ∈ 1:length(ARGS) ]
    for a in _ARGS
         push!(ARGS, a)
    end
end

end # module
