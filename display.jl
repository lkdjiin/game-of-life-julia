module Display

function draw(generation)
    run(`clear`)
    output = replace(repr(generation)[2:end-1], " ", "")
    output = replace(output, "1", "@")
    output = replace(output, "0", " ")

    println(output)
end

end
