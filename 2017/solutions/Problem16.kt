
class Problem16: Problem() {
    override fun partA(): Any {
        val danceMoves = inputAsListOfStrings()
        return dance(danceMoves)
    }

    override fun partB(): Any {
        val danceMoves = inputAsListOfStrings()
        return danceFor(danceMoves, 1_000_000_000)
    }

    private fun danceFor(danceMoves: List<String>, times: Int): String {
        var lastPosition = ""
        val positionsSeen = mutableSetOf<String>()
        for (i in 0 until times) {
            lastPosition = if (i > 0) {
                dance(danceMoves, lastPosition.toList())
            } else {
                dance(danceMoves)
            }

            if (positionsSeen.contains(lastPosition)) {
                break
            }

            positionsSeen.add(lastPosition)
        }

        return positionsSeen.toList()[times.rem(positionsSeen.size) - 1]
    }

    private fun dance(danceMoves: List<String>, initialPosition: List<Char>? = null): String {
        var positions: MutableList<Char>

        if (initialPosition == null) {
            positions = mutableListOf()
            positions.plusAssign('a'..'z')
            positions = positions.take(extraInput as Int).toMutableList()
        } else {
            positions = initialPosition.toMutableList()
        }

        danceMoves.forEach { danceMove ->
            val params = danceMove.substring(1).split("/")

            when (danceMove[0]) {
                's' -> {
                    val spinSize = params[0].toInt()
                    val temp = positions.takeLast(spinSize).toMutableList()
                    positions = positions.dropLast(spinSize).toMutableList()
                    temp += positions
                    positions = temp
                }
                'x' -> {
                    val indexA = params[0].toInt()
                    val indexB = params[1].toInt()

                    val tmp = positions[indexA]
                    positions[indexA] = positions[indexB]
                    positions[indexB] = tmp
                }
                'p' -> {
                    val progA = params[0][0]
                    val progB = params[1][0]

                    val indexA = positions.indexOfFirst { it == progA }
                    val indexB = positions.indexOfFirst { it == progB }

                    val tmp = positions[indexA]
                    positions[indexA] = positions[indexB]
                    positions[indexB] = tmp
                }
                else -> throw IllegalArgumentException("Unexpected instruction: $danceMove")
            }
        }

        return positions.fold("", { acc, c -> acc + c})
    }

}