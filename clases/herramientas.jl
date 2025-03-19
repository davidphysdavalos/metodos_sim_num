__precompile__() # Este comando es para que julia precompile el paquete

module herramientas

export original_integer, base_2, custom_unique

@doc "original integer input: list of binary digits output: integer"
function original_integer(list)
    return parse(Int, join(list); base=2)
end

@doc "base_2 input: integer and pad optional output: list of binary digits"
function base_2(integer; pad= nothing)
    if pad == nothing
        return reverse(digits(integer, base = 2))
    else
        return reverse(digits(integer, base = 2, pad = pad))
    end
end

function is_approx_equal(x, y)
    return norm(x - y) < tolerance
end

@doc "custom_unique input: list output: list with unique elements. This function aims to correct the behavior of unique that selects -0.0 and 0.0 as different numbers"
function custom_unique(list)
    filtered_vals = []
    for v in list
        if all(!is_approx_equal(v, fv) for fv in filtered_vals)
            push!(filtered_vals, v)
        end
    end
    return filtered_vals
end

end