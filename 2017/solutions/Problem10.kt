import common.KnotHash
import common.toHexString
import common.reverse

class Problem10 : Problem() {
    override fun partA(): Any {
        val inputLengths = inputAsListOfInts()
        val listSize = extraInput!! as Int

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
        val inputByteArray = ByteArray(input.length)
        input.forEachIndexed {index, value -> inputByteArray[index] = value.toByte()}

        val hashSize = extraInput!! as Int
        val knotHash = KnotHash(inputByteArray, hashSize = hashSize)

        return knotHash.computeHash().toHexString()
    }
}