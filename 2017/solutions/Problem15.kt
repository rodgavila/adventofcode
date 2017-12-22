import kotlin.coroutines.experimental.buildSequence

class Problem15 : Problem() {
    override fun partA(): Any {
        val input = inputAsListOfInts()
        val generatorASeed = input[0].toLong()
        val generatorBSeed = input[1].toLong()

        val generatorA = buildDuelingGeneratorSequence(generatorASeed, 16807, 2147483647)
        val generatorB = buildDuelingGeneratorSequence(generatorBSeed, 48271, 2147483647)

        return generatorA.zip(generatorB, {a:Long, b:Long -> Pair(a, b)})
                .take(40_000_000)
                .filter { it.first.and(0xFFFF) == it.second.and(0xFFFF) }
                .count()
    }

    override fun partB(): Any {
        val input = inputAsListOfInts()
        val generatorASeed:Long = input[0].toLong()
        val generatorBSeed:Long = input[1].toLong()

        val generatorA = buildDuelingGeneratorSequence(generatorASeed, 16807, 2147483647, 4)
        val generatorB = buildDuelingGeneratorSequence(generatorBSeed, 48271, 2147483647, 8)

        return generatorA.zip(generatorB, {a:Long, b:Long -> Pair(a, b)})
                .take(5_000_000)
                .filter { it.first.and(0xFFFF) == it.second.and(0xFFFF) }
                .count()
    }

    @Suppress("EXPERIMENTAL_FEATURE_WARNING")
    private fun buildDuelingGeneratorSequence(seed: Long, a: Long, b: Long, c: Long? = null): Sequence<Long> {
        return buildSequence {
            var current = seed

            while (true) {
                current = current.times(a).rem(b)

                if (c == null) {
                    yield(current)
                } else if (current.rem(c) == 0.toLong()) {
                    yield(current)
                }
            }
        }
    }
}