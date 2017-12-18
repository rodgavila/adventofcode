import java.util.Scanner

class Problem9 : Problem() {

    override fun partA(): Any {
        val cleanInput = clean(input)

        return findScore(cleanInput)
    }

    override fun partB(): Any {
        val originInput = input.length
        val cleanInput = clean(input).length
        val garbageGroups = countGarbageGroups(input)
        val canceledChars = countCanceledCharacters(input)

        return originInput - cleanInput - 2 * garbageGroups - 2 * canceledChars
    }

    private fun findScore(string: String): Int {
        var curLevel = 1
        var curScore = 0

        string.forEach {
            when (it) {
                '{' -> curScore += curLevel++
                '}' -> curLevel--
            }
        }

        return curScore
    }

    companion object {
        val GARBAGE_PATTERN = Regex("<([^!>]|!.)*>").toPattern()
        val CANCELED_PATTERN = Regex("(!.)").toPattern()

        fun clean(string: String): String {
            val scanner = Scanner(string).useDelimiter(GARBAGE_PATTERN)
            val returnBuilder = StringBuilder()

            while (scanner.hasNext()) {
                returnBuilder.append(scanner.next())
            }

            return returnBuilder.toString()
        }

        fun countGarbageGroups(string: String): Int {
            val scanner = Scanner(string).useDelimiter(GARBAGE_PATTERN)
            var groupCount = 0

            while (scanner.hasNext()) {
                scanner.next()
                groupCount++
            }

            return --groupCount
        }

        fun countCanceledCharacters(string: String): Int {
            val scanner = Scanner(string).useDelimiter(CANCELED_PATTERN)
            var canceledCount = 0

            while (scanner.hasNext()) {
                scanner.next()
                canceledCount++
            }

            return --canceledCount
        }
    }
}