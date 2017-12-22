import java.io.File
import java.util.Scanner

abstract class Problem {
    lateinit var input: String
    var extraInput: Any? = null

    abstract fun partA() : Any

    abstract fun partB() : Any

    fun loadInputFromFile(filename: String) {
        val inputStream = File(filename).inputStream()
        input = inputStream.bufferedReader().use { it.readText() }
    }

    fun inputAsListOfInts() : List<Int> {
        val scanner = Scanner(input).useDelimiter("\\p{javaWhitespace}*(,|\\p{javaWhitespace})\\p{javaWhitespace}*")
        val returnList = mutableListOf<Int>()

        while (scanner.hasNextInt()) {
            returnList.add(scanner.nextInt())
        }

        return returnList
    }

    fun inputAsListOfStrings() : List<String> {
        val scanner = Scanner(input).useDelimiter("\\p{javaWhitespace}*(,|\\p{javaWhitespace})\\p{javaWhitespace}*")
        val returnList = mutableListOf<String>()

        while (scanner.hasNext()) {
            returnList.add(scanner.next())
        }

        return returnList
    }
}