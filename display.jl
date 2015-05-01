module Display

function draw(generation, sym="@", noll=" ")
    run(`clear`)
    output = replace(repr(generation)[2:end-1], " ", "")
    output = replace(output, "1", sym)
    output = replace(output, "0", noll)

    println(output)
end

end
