module Cell

# Compute the next state (dead or alive) of a given cell.
#
# cell         - The cell to study (0 or 1).
# neighborhood - The state of the cell's neighborhood, that is a number
#                from 1 to 9.
function next(cell, neighborhood)
    if neighborhood == 3
        1
    elseif neighborhood == 4
        cell
    else
        0
    end
end

end
