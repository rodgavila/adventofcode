class Problem1 : Problem() {

    override fun partA(): Any {
        return input.foldIndexed(0) { i, total, c ->
            val otherIndex = (i + 1) % input.length
            if (c == input[otherIndex]) {
                total + c.minus('0')
            } else {
                total
            }
        }
    }

    override fun partB(): Any {
        return input.foldIndexed(0) { i, total, c ->
            val otherIndex = (i + (input.length / 2)) % input.length
            if (c == input[otherIndex]) {
                total + c.minus('0')
            } else {
                total
            }
        }
    }
}