import common.merge
import common.reverse
import common.toHexString
import common.toIntAsUnsigned
import org.junit.Test
import kotlin.test.assertEquals

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
        val byteArray = ByteArray(4)
        byteArray[0] = 0x8B.toByte()
        byteArray[1] = 0xAD.toByte()
        byteArray[2] = 0xF0.toByte()
        byteArray[3] = 0x0D.toByte()

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

        val expectedArray = ByteArray(5)
        expectedArray[0] = 0.toByte()
        expectedArray[1] = 3.toByte()
        expectedArray[2] = 2.toByte()
        expectedArray[3] = 1.toByte()
        expectedArray[4] = 4.toByte()

        for (i in 0 until 5) {
            assertEquals(expectedArray[i], byteArray[i])
        }
    }

    @Test
    fun testReverseInPlace_Wrap() {
        val byteArray = ByteArray(10, {it.toByte()})
        byteArray.reverse(7, 6)

        val expectedArray = ByteArray(10)
        expectedArray[0] = 9.toByte()
        expectedArray[1] = 8.toByte()
        expectedArray[2] = 7.toByte()
        expectedArray[3] = 3.toByte()
        expectedArray[4] = 4.toByte()
        expectedArray[5] = 5.toByte()
        expectedArray[6] = 6.toByte()
        expectedArray[7] = 2.toByte()
        expectedArray[8] = 1.toByte()
        expectedArray[9] = 0.toByte()

        for (i in 0 until 10) {
            assertEquals(expectedArray[i], byteArray[i])
        }
    }

    @Test
    fun mergeByteArrays() {
        val byteArray1 = ByteArray(4)
        byteArray1[0] = 0x8B.toByte()
        byteArray1[1] = 0xAD.toByte()
        byteArray1[2] = 0xF0.toByte()
        byteArray1[3] = 0x0D.toByte()

        val byteArray2 = ByteArray(5)
        byteArray2[0] = 0x1C.toByte()
        byteArray2[1] = 0xAF.toByte()
        byteArray2[2] = 0xED.toByte()
        byteArray2[3] = 0xEC.toByte()
        byteArray2[4] = 0xAF.toByte()

        val expectedArray = ByteArray(9)
        expectedArray[0] = 0x8B.toByte()
        expectedArray[1] = 0xAD.toByte()
        expectedArray[2] = 0xF0.toByte()
        expectedArray[3] = 0x0D.toByte()
        expectedArray[4] = 0x1C.toByte()
        expectedArray[5] = 0xAF.toByte()
        expectedArray[6] = 0xED.toByte()
        expectedArray[7] = 0xEC.toByte()
        expectedArray[8] = 0xAF.toByte()

        val mergedArray = merge(byteArray1, byteArray2)

        assertEquals(9, mergedArray.size)

        for (i in 0 until 9) {
            assertEquals(expectedArray[i], mergedArray[i])
        }
    }
}