include("neighborhood.jl")
include("cell.jl")
include("generation.jl")
include("display.jl")

function main(height, width, number_of_generation)
    generation = Generation.create(height, width)
    for _ in 1:number_of_generation
        Display.draw(generation)
        sleep(0.8)
        generation = Generation.next(generation)
    end
end

main(20, 80, 1)
