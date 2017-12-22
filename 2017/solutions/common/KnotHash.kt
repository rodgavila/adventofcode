package common

import kotlin.experimental.xor

class KnotHash(private val data: ByteArray, private val seed: ByteArray = DEFAULT_SEED,
               private val salt: Int = 64, private val hashSize: Int = 256) {

    companion object {
        private val DEFAULT_SEED:ByteArray = byteArrayOf(17, 31, 73, 47, 23)
    }

    fun computeHash(): ByteArray {

        val input = merge(data, seed)
        val hash = ByteArray(hashSize, {it.toByte()})
        var skipSize = 0
        var currentPosition = 0

        repeat(salt) {
            input.forEach {
                hash.reverse(currentPosition, it.toIntAsUnsigned())
                currentPosition = (currentPosition + it.toIntAsUnsigned() + skipSize++).rem(hashSize)
            }
        }

        // Condense hash (device in chunks of 16 and xor each group)
        val denseHash:List<Byte> = hash.iterator().asSequence().chunked(16).map { chunk ->
            chunk.reduce { acc, byte -> acc.xor(byte) }
        }.toList()

        val returnArray = ByteArray(denseHash.size)

        denseHash.forEachIndexed { index, value ->
            returnArray[index] = value
        }

        return returnArray
    }
}