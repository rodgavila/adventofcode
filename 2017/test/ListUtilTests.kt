import org.junit.Test
import kotlin.test.assertEquals
import common.reverse

class ListUtilTests {
    @Test
    fun testReverseInPlace_Middle() {
        val list = MutableList(5, {it})
        list.reverse(1, 3)
        assertEquals(mutableListOf(0, 3, 2, 1, 4), list)
    }

    @Test
    fun testReverseInPlace_Wrap() {
        val list = MutableList(10, { it })
        list.reverse(7, 6)
        assertEquals(mutableListOf(9, 8, 7, 3, 4, 5, 6, 2, 1, 0), list)
    }
}