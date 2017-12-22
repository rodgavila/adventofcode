import common.merge
import common.reverse
import common.toBitSetBigEndian
import common.toHexString
import common.toIntAsUnsigned
import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse

class ByteUtilTests {
    @Test
    fun byteToHexString() {
        assertEquals("00", 0x00.toByte().toHexString())
        assertEquals("01", 0x01.toByte().toHexString())
        assertEquals("0f", 0x0F.toByte().toHexString())
        assertEquals("10", 0x10.toByte().toHexString())
        assertEquals("ff", 0xFF.toByte().toHexString())
    }

    @Test
    fun byteArrayToHexString() {
        val byteArray = byteArrayOf(0x8B.toByte(), 0xAD.toByte(), 0xF0.toByte(), 0x0D.toByte())

        assertEquals("8badf00d", byteArray.toHexString())
    }

    @Test
    fun byteToIntUnsigned() {
        assertEquals(0, 0.toByte().toIntAsUnsigned())
        assertEquals(32, 0x20.toByte().toIntAsUnsigned())
        assertEquals(128, 0x80.toByte().toIntAsUnsigned())
        assertEquals(255, 0xFF.toByte().toIntAsUnsigned())
    }

    @Test
    fun testReverseInPlace_Middle() {
        val byteArray = ByteArray(5, {it.toByte()})
        byteArray.reverse(1, 3)

        val expectedArray = byteArrayOf(0, 3, 2, 1, 4)

        for (i in 0 until 5) {
            assertEquals(expectedArray[i], byteArray[i])
        }
    }

    @Test
    fun testReverseInPlace_Wrap() {
        val byteArray = ByteArray(10, {it.toByte()})
        byteArray.reverse(7, 6)

        val expectedArray = byteArrayOf(9, 8, 7, 3, 4, 5, 6, 2, 1, 0)

        for (i in 0 until 10) {
            assertEquals(expectedArray[i], byteArray[i])
        }
    }

    @Test
    fun mergeByteArrays() {
        val byteArray1 = byteArrayOf(0x8B.toByte(), 0xAD.toByte(), 0xF0.toByte(), 0x0D.toByte())
        val byteArray2 = byteArrayOf(0x1C.toByte(), 0xAF.toByte(), 0xED.toByte(), 0xEC.toByte(), 0xAF.toByte())

        val expectedArray = byteArrayOf(0x8B.toByte(), 0xAD.toByte(), 0xF0.toByte(), 0x0D.toByte(),
                                        0x1C.toByte(), 0xAF.toByte(), 0xED.toByte(), 0xEC.toByte(), 0xAF.toByte())

        val mergedArray = merge(byteArray1, byteArray2)

        assertEquals(9, mergedArray.size)

        for (i in 0 until 9) {
            assertEquals(expectedArray[i], mergedArray[i])
        }
    }

    @Test
    fun toBitSetBigEndian() {
        val byteArray = byteArrayOf(0xCA.toByte(), 0xFE.toByte())
        val bitSet = byteArray.toBitSetBigEndian()

        // C
        assertEquals(true,  bitSet[0])
        assertEquals(true,  bitSet[1])
        assertEquals(false, bitSet[2])
        assertEquals(false, bitSet[3])

        // A
        assertEquals(true,  bitSet[4])
        assertEquals(false, bitSet[5])
        assertEquals(true,  bitSet[6])
        assertEquals(false, bitSet[7])

        // F
        assertEquals(true,  bitSet[8])
        assertEquals(true,  bitSet[9])
        assertEquals(true, bitSet[10])
        assertEquals(true, bitSet[11])

        // E
        assertEquals(true,  bitSet[12])
        assertEquals(true, bitSet[13])
        assertEquals(true,  bitSet[14])
        assertEquals(false, bitSet[15])

        for (i in 16..63) {
            assertFalse(bitSet[i])
        }
    }
}