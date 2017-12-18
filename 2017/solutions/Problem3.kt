import kotlin.math.floor
import kotlin.math.pow
import kotlin.math.sqrt

class Problem3 : Problem() {

    override fun partA(): Any {
        val number = input.toInt()

        if (number == 1) {
            return 0
        }

        val ringNum = getRingOf(number)

        // How far are we from the beginning of the ring (a^2+1)
        val offset = number - (ringNum * 2 - 1).toDouble().pow(2).toInt() - 1

        // Ring sequence
        val distanceSequence = generateSequence(ringNum)

        return distanceSequence[offset.rem(distanceSequence.size)]
    }

    override fun partB(): Any {
        val number = input.toInt()
        val grid = mutableMapOf<Pair<Int, Int>, Int>()

        grid[Pair(0, 0)] = 1

        spiralSequence().drop(1).forEach {
            val sum = sumOfAdjacent(it, grid)
            grid[it] = sum

            if (sum > number) {
                return sum
            }
        }

        throw IllegalStateException("What are we doing here")
    }

    companion object {

        fun getRingOf(n: Int): Int {
            val floorOfSqrt = floor(sqrt((n-1).toDouble())).toInt()
            val a = if (floorOfSqrt % 2 == 1) floorOfSqrt else (floorOfSqrt-1)

            return (a + 1) / 2
        }


        fun generateSequence(ringNumber: Int): List<Int> {
            val a = ringNumber * 2 - 1
            val size = a + 1
            val returnList = mutableListOf<Int>()
            val dec = a / 2

            var n = a
            for (i in 0 until dec) {
                returnList.add(n--)
            }

            for (i in 0 until (size-dec)) {
                returnList.add(n++)
            }

            return returnList
        }

        fun listOfAdjacent(coord: Pair<Int, Int>): List<Pair<Int, Int>> {
            return listOf(
                    Pair(coord.first - 1, coord.second - 1),
                    Pair(coord.first - 1, coord.second),
                    Pair(coord.first - 1, coord.second + 1),
                    Pair(coord.first, coord.second - 1),
                    Pair(coord.first, coord.second + 1),
                    Pair(coord.first + 1, coord.second - 1),
                    Pair(coord.first + 1, coord.second),
                    Pair(coord.first + 1, coord.second + 1)
            )
        }

        fun sumOfAdjacent(coord: Pair<Int, Int>, grid: Map<Pair<Int, Int>, Int>): Int {
            return listOfAdjacent(coord).map { grid[it] ?: 0 }.sum()
        }
    }
}

fun spiralSequence(): Sequence<Pair<Int, Int>> {
    return SpiralSequence()
}

class SpiralSequence : Sequence<Pair<Int, Int>> {
    override fun iterator(): Iterator<Pair<Int, Int>> {
        return SpiralSequenceIterator()
    }

    private class SpiralSequenceIterator : Iterator<Pair<Int, Int>> {
        var x: Int = 0
        var y: Int = 0
        var sideSize: Int = 2
        val cachePoints = mutableListOf<Pair<Int, Int>>()

        override fun next(): Pair<Int, Int> {
            if (cachePoints.isEmpty()) {
                refillCache()
            }

            return cachePoints.removeAt(0)
        }

        fun refillCache() {
            cachePoints.add(Pair(x, y))
            x++
            for (j in 0 until sideSize - 1) {
                cachePoints.add(Pair(x, y))
                y++
            }

            for (j in 0 until sideSize) {
                cachePoints.add(Pair(x, y))
                x--
            }

            for (j in 0 until sideSize) {
                cachePoints.add(Pair(x, y))
                y--
            }

            for (j in 0 until sideSize) {
                cachePoints.add(Pair(x, y))
                x++
            }

            sideSize += 2
        }

        override fun hasNext(): Boolean = true // Sequence is infinite
    }
}