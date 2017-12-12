import java.util.Scanner

class Problem4 : Problem() {
    override fun partA(): Any {
        val scanner = Scanner(input)
        var validCount = 0

        while (scanner.hasNextLine()) {
            if (isValid(scanner.nextLine())) {
                validCount++
            }
        }

        return validCount
    }

    override fun partB(): Any {
        val scanner = Scanner(input)
        var validCount = 0

        while (scanner.hasNextLine()) {
            if (isValid(scanner.nextLine(), true)) {
                validCount++
            }
        }

        return validCount
    }

    companion object {
        fun isValid(passphrase: String, superSecure: Boolean = false): Boolean {
            var words = passphrase.split(" ")

            if (superSecure) {
                words = words.map {
                    val charArray = it.toCharArray()
                    charArray.sort()
                    String(charArray)
                }
            }

            return words.size == words.distinct().size
        }
    }
}