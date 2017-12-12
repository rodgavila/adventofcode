import java.io.File
import java.util.Scanner

abstract class Problem {
    lateinit var input: String

    abstract fun partA() : Any

    abstract fun partB() : Any

    fun loadInputFromFile(filename: String) {
        val inputStream = File(filename).inputStream()
        input = inputStream.bufferedReader().use { it.readText() }
    }

    fun inputAsListOfInts() : List<Int> {
        val scanner = Scanner(input)
        val returnList = mutableListOf<Int>()

        while (scanner.hasNextInt()) {
            returnList.add(scanner.nextInt())
        }

        return returnList
    }
}