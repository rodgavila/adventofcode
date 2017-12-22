
class Problem17: Problem() {
    override fun partA(): Any {
        val numSteps = input.toInt()
        val iterations = extraInput!! as Int

        val list = mutableListOf(0)

        var curIndex = 0
        for (i in 1..iterations) {
            val newIndex = (curIndex + numSteps) % i

            if (newIndex == list.size) {
                list.add(i)
            } else {
                list.add(newIndex + 1, i)
            }

            curIndex = newIndex + 1
        }

        return list[(list.indexOf(2017) + 1) % list.size]
    }

    override fun partB(): Any {
        val numSteps = input.toInt()
        val iterations = extraInput!! as Int

        // Value zero will always be at index zero, so basically we're only interested on the element
        // that will be at index 1 after the iterations.
        var lastItemAddedAtIndexOne = -1
        var curIndex = 0

        for (i in 1..iterations) {
            curIndex = (curIndex + numSteps) % i + 1

            if (curIndex == 1) {
                lastItemAddedAtIndexOne = i
            }
        }

        return lastItemAddedAtIndexOne
    }
}