function mandelbrot(a::ComplexF64)
    z = 0
    for i=1:50
        z = z^2 + a
    end
    return z
end

function getSize(n::Float64)
    return ceil(Int64,(0.5 - -2) / (0.0315*n)),ceil(Int64,(-1.0 - 1.0) / (-0.05*n))+1
end
 
function genMandelbrot(n::Float64)
    w::Int64 = ceil(Int64,(-1.0 - 1.0) / (-0.05*n))+1
    h::Int64 = ceil(Int64,(0.5 - -2) / (0.0315*n))
    m = Matrix{Float64}(undef,h,w)
    cx::Int64 = 1
    cy::Int64 = 1
    Threads.@threads for y = 1.0:(-0.05*n):-1.0
        cx = 1
        for x = -2.0:(0.0315*n):0.5
            @inbounds m[cx,cy] = abs(mandelbrot(complex(x, y)))
            cx += 1
        end
        cy += 1
    end
    return m
end

function test()
# 1.0     : (80, 41)           : 3,280
# 0.1     : (794, 401)         : 318,394
# 0.01    : (7937, 4001)       : 31,755,937
# 0.001   : (79366, 40001)     : 3,174,719,366
# 0.0001  : (793651, 400001)   : 317,461,193,651
# 0.00001 : (7936508, 4000001) : 31,746,040,000,000

# julia --threads 8 mandelbrot.jl

mandelbrotSize = 0.001 
println("USING "*string(Threads.nthreads())*" THREADS!")
println("PRE-COMPILED")
@time genMandelbrot(1.0)
println("COMPILED")
@time genMandelbrot(mandelbrotSize)
println("SIZE: "*string(getSize(mandelbrotSize)))
end

test()
