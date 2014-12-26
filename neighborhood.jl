module Neighborhood

# Compute the number of live cells in a neighborhood.
#
# cells - 9 cells: a cell and his 8 neighbors.
state(cells) = countnz(cells)

function extract(generation, y, x)
    height, width = size(generation)
    yrange = range_for(y, height)
    xrange = range_for(x, width)
    generation[yrange, xrange]
end

function range_for(coordinate, dimension)
    low = coordinate == 1 ? 1 : coordinate - 1
    up  = coordinate == dimension ? dimension : coordinate + 1
    low:up
end

end
