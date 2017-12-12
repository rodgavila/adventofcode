import java.util.Scanner

class Problem6 : Problem() {
    override fun partA(): Any {
        val banks = inputAsListOfInts()
        return runRedistribution(banks).first
    }

    override fun partB(): Any {
        val banks = inputAsListOfInts()
        return runRedistribution(banks).second
    }

    /**
     * Run the distribution
     * @return a pair of (number of cycles needed to find a seen state, loop size)
     */
    private fun runRedistribution(initialState: List<Int>): Pair<Int, Int> {
        val banks = initialState.toMutableList()
        val seen = mutableSetOf<String>()

        seen.add(banks.toString())

        while(true) {
            redistribute(banks)

            if (seen.contains(banks.toString())) {
                return Pair(seen.size,  seen.size - seen.indexOf(banks.toString()))
            }

            seen.add(banks.toString())
        }
    }

    companion object {
        fun redistribute(banks: MutableList<Int>) {
            var blocks = banks.max()!!
            val indexOfMax: Int = banks.indexOf(blocks)

            banks[indexOfMax] = 0
            var i = indexOfMax
            while (blocks > 0) {
                i = (i+1) % banks.size
                banks[i]++
                blocks--
            }
        }
    }
}