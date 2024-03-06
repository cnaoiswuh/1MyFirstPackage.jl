"""
    AbstractLBConfig{D, N}

An abstract type for lattice Boltzmann configurations.
"""
abstract type AbstractLBConfig{D, N} end
"""
    D2Q9 <: AbstractLBConfig{2, 9}

A lattice Boltzmann configuration for 2D, 9-velocity model.
"""
struct D2Q9 <: AbstractLBConfig{2, 9} end
directions(::D2Q9) = (
        Point(1, 1), Point(-1, 1),
        Point(1, 0), Point(0, -1),
        Point(0, 0), Point(0, 1),
        Point(-1, 0), Point(1, -1),
        Point(-1, -1),
    )
# directions[k] is the opposite of directions[flip_direction_index(k)
function flip_direction_index(::D2Q9, i::Int)
    return 10 - i
end
# the density of the fluid, each component is the density of a velocity
struct Cell{N, T <: Real}
    density::NTuple{N, T}
end
# the total density of the fluid
density(cell::Cell) = sum(cell.density)
# the density of the fluid in a specific direction,
# where the direction is an integer
density(cell::Cell, direction::Int) = cell.density[direction]
