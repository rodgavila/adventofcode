import java.lang.Math.floor
import java.util.Scanner

/**
 * Reverses a part of the list in place.
 *
 * @param fromIndex first element to reverse
 * @param numElements number of elements to reverse (if numElements is greater than the size of the list, it will wrap
 * as if it was a circular list
 */
fun <T> MutableList<T>.reverse(fromIndex: Int, numElements: Int) {
    val sublist = mutableListOf<T>()

    for (i in 0 until numElements) {
        sublist.add(this[(fromIndex + i).rem(this.size)])
    }

    sublist.reverse()

    for (i in 0 until numElements) {
        this[(fromIndex + i).rem(this.size)] = sublist[i]
    }
}

fun Int.toTwoCharsHexString(): String {
    if (this !in 0..255) {
        throw IllegalArgumentException("Number must be greater than zero an less than 255")
    }

    return if (this < 16) {
        "0" + this.toString(16)
    } else {
        this.toString(16)
    }
}

class Problem10 : Problem() {
    override fun partA(): Any {
        val inputLengths = inputAsListOfInts()
        val listSize = input2!! as Int

        val hash = MutableList(listSize, {it})
        var skipSize = 0
        var currentPosition = 0

        inputLengths.forEach {
            hash.reverse(currentPosition, it)
            currentPosition = (currentPosition + it + skipSize++).rem(listSize)
        }

        return hash[0] * hash[1]
    }

    override fun partB(): Any {
        val inputLengths = mutableListOf<Int>()
        inputLengths.addAll(input.map { it.toInt() })
        inputLengths.addAll(listOf(17, 31, 73, 47, 23))

        val listSize = input2!! as Int

        val hash = MutableList(listSize, {it})
        var skipSize = 0
        var currentPosition = 0

        repeat(64) {
            inputLengths.forEach {
                hash.reverse(currentPosition, it)
                currentPosition = (currentPosition + it + skipSize++).rem(listSize)
            }
        }

        // Condense hash (device in chunks of 16 and xor each group)
        val denseHash2 = hash.chunked(16) {
            it.reduce { acc, e -> acc.xor(e) }
        }

        val denseHashAsString = denseHash2.fold("", { acc, e ->
            acc + e.toTwoCharsHexString()
        })

        return denseHashAsString
    }
}