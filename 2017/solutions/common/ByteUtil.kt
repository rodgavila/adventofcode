package common

import java.util.BitSet
import kotlin.experimental.and

fun Byte.toHexString(): String {
    val octet = this.toInt()

    val first = octet.and(0xF0).ushr(4)
    val second = octet.and(0x0F)

    return first.toString(16) + second.toString(16)
}

inline fun Byte.toIntAsUnsigned(): Int {
    return if (this.toInt() >= 0) {
        this.toInt()
    } else {
        this.and(0b01111111.toByte()).toInt().or(0b10000000)
    }
}

fun ByteArray.toHexString(): String {
    val returnValue = StringBuilder()

    this.forEach {
        returnValue.append(it.toHexString())
    }

    return returnValue.toString()
}

fun ByteArray.toBitSetBigEndian(): BitSet {
    val bitSet = BitSet.valueOf(this)

    // ValueOf is little-endian, make it big-endian

    for (i in 0 until this.size) {
        for (j in 0..3) {
            val tmp = bitSet[i*8 + 7 - j]
            bitSet[i*8 + 7 - j] = bitSet[i*8 + j]
            bitSet[i*8 + j] = tmp
        }
    }

    return bitSet
}

/**
 * Reverses part of the array in place.
 *
 * @param fromIndex first element to reverse
 * @param numElements number of elements to reverse (if numElements is greater than the size of the list, it will wrap
 * as if it was a circular list
 */
fun ByteArray.reverse(fromIndex: Int, numElements: Int) {
    val subarray = ByteArray(numElements)

    for (i in 0 until numElements) {
        subarray[i] = this[(fromIndex + i).rem(this.size)]
    }

    subarray.reverse()

    for (i in 0 until numElements) {
        this[(fromIndex + i).rem(this.size)] = subarray[i]
    }
}

fun merge(lhs: ByteArray, rhs: ByteArray): ByteArray {
    val returnArray = ByteArray(lhs.size + rhs.size)

    System.arraycopy(lhs, 0, returnArray, 0, lhs.size)
    System.arraycopy(rhs, 0, returnArray, lhs.size, rhs.size)

    return returnArray
}