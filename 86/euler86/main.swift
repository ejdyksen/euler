import Foundation // because you can't get sqrt anywhere else

struct Cuboid {
    let length: Int
    let width: Int
    let height: Int

    init(_ length: Int, _ width: Int, _ height: Int) {
        self.length = length
        self.width = width
        self.height = height
    }

    var shortestPath: Float {
        return sqrt(pow(Float(length), 2) + pow(Float(width + height), 2))
    }

    var hasIntegerShortestPath: Bool {
        return floor(shortestPath) == shortestPath
    }
}

func smallestM(goal: Int) -> Int {
    var m = 1
    var cuboidsFound = 0

    while true {
        for w in 1...m {
            for h in 1...w {
                let c = Cuboid(m, w, h)

                if c.hasIntegerShortestPath {
                    cuboidsFound++
                    if cuboidsFound == goal {
                        return m
                    }
                }

            }
        }

        m++
    }
}

println(smallestM(1_000_000))
