class Problem5 : Problem() {
    override fun partA(): Any {
        val offsets = inputAsListOfInts().toMutableList()
        var steps = 0
        var current = 0

        while (true) {
            if (current < 0 || current >= offsets.size) {
                return steps
            }
            val prevValue = offsets[current]
            offsets[current]++
            current+= prevValue
            steps++
        }
    }

    override fun partB(): Any {
        val offsets = inputAsListOfInts().toMutableList()
        var steps = 0
        var current = 0

        while (true) {
            if (current < 0 || current >= offsets.size) {
                return steps
            }
            val prevValue = offsets[current]
            if (prevValue >= 3) {
                offsets[current]--
            } else {
                offsets[current]++
            }
            current+= prevValue
            steps++
        }
    }
}