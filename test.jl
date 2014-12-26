include("neighborhood.jl")
include("cell.jl")
include("generation.jl")

using Base.Test

HEIGHT = 3
WIDTH  = 4

created_generation = Generation.create(HEIGHT, WIDTH)
@test typeof(created_generation) == Array{Int,2}
@test size(created_generation) == (HEIGHT, WIDTH)
for i in 1:length(created_generation)
    @test created_generation[i] in 0:1
end

@test Neighborhood.state([ 0 1 1 0 0 0 1 1 1]) == 5

ALIVE = 1
DEAD  = 0

@test Cell.next(ALIVE, 5) == 0
@test Cell.next(DEAD, 3) == 1
@test Cell.next(DEAD, 4) == 0
@test Cell.next(ALIVE, 4) == 1

generation = [ 0 1 0 1 ;
               1 1 1 1 ;
               0 0 0 0 ;
               1 0 1 0 ]

@test Neighborhood.extract(generation, 2, 3) == [ 1 0 1 ; 1 1 1 ; 0 0 0 ]
@test Neighborhood.extract(generation, 3, 2) == [ 1 1 1 ; 0 0 0 ; 1 0 1 ]

@test Neighborhood.extract(generation, 1, 2) == [ 0 1 0 ; 1 1 1 ]
@test Neighborhood.extract(generation, 4, 3) == [ 0 0 0 ; 0 1 0 ]

@test Neighborhood.extract(generation, 3, 1) == [ 1 1 ; 0 0 ; 1 0 ]
@test Neighborhood.extract(generation, 2, 4) == [ 0 1 ; 1 1 ; 0 0 ]

@test Neighborhood.extract(generation, 1, 1) == [ 0 1 ; 1 1 ]
@test Neighborhood.extract(generation, 4, 1) == [ 0 0 ; 1 0 ]
@test Neighborhood.extract(generation, 1, 4) == [ 0 1 ; 1 1 ]
@test Neighborhood.extract(generation, 4, 4) == [ 0 0 ; 1 0 ]

@test Generation.next(generation) == [ 1 1 0 1 ;
                                       1 1 0 1 ;
                                       1 0 0 1 ;
                                       0 0 0 0 ]
