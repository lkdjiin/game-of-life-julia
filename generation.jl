module Generation

using ..Neighborhood: extract, state
using ..Cell

create(height, width) = rand(0:1, height, width)

function next(generation)
    height, width = size(generation)
    indexes = [(y, x) for y in 1:height, x in 1:width]
    map((yx) -> newstate(generation, yx...), indexes)
end

function newstate(generation, y, x)
    neighborhood = extract(generation, y, x)
    Cell.next(generation[y, x], state(neighborhood))
end

end
