import kotlin.math.absoluteValue
import kotlin.math.floor
import kotlin.math.max

class Problem11 : Problem() {
    override fun partA(): Any {
        val path = inputAsListOfStrings()
        return followPath(path).first
    }

    override fun partB(): Any {
        val path = inputAsListOfStrings()
        return followPath(path).second
    }

    private fun followPath(path: List<String>): Pair<Int, Int> {
        var x = 0
        var y = 0.0
        var maxDistance = Integer.MIN_VALUE

        path.forEach {
            when(it) {
                "n" -> y += 1.0
                "s" -> y -= 1.0
                "ne" -> {
                    x += 1
                    y += 0.5
                }
                "se"-> {
                    x += 1
                    y -= 0.5
                }
                "nw" -> {
                    x -= 1
                    y += 0.5
                }
                "sw" -> {
                    x -= 1
                    y -= 0.5
                }
                else -> throw IllegalArgumentException(it)
            }

            maxDistance = max(maxDistance, distance(x, y))
        }

        return Pair(distance(x, y), maxDistance)
    }

    private fun distance(x: Int, y: Double): Int {
        // For every abs(x) we're forced to take a step east or west, there's no way around that.
        // However, while doing that we will save half a north/south step, so we can subtract that.
        return x.absoluteValue + floor((y.absoluteValue - 0.5.times(x.absoluteValue))).toInt()
    }
}