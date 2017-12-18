import org.junit.Test
import kotlin.test.assertEquals

class Problem11Tests {

    @Test
    fun testPartA_Sample1() {
        val problem = Problem11()
        problem.input = "ne,ne,ne"
        assertEquals(3, problem.partA())
    }

    @Test
    fun testPartA_Sample2() {
        val problem = Problem11()
        problem.input = "ne,ne,sw,sw"
        assertEquals(0, problem.partA())
    }

    @Test
    fun testPartA_Sample3() {
        val problem = Problem11()
        problem.input = "ne,ne,s,s"
        assertEquals(2, problem.partA())
    }


    @Test
    fun testPartA_Sample4() {
        val problem = Problem11()
        problem.input = "se,sw,se,sw,sw"
        assertEquals(3, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem11()
        problem.loadInputFromFile("./input/11.txt")
        assertEquals(720, problem.partA())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem11()
        problem.loadInputFromFile("./input/11.txt")
        assertEquals(1485, problem.partB())
    }

    @Test
    fun testReverseInPlace_Middle() {
        val list = MutableList(5, {it})
        list.reverse(1, 3)
        assertEquals(mutableListOf(0, 3, 2, 1, 4), list)
    }

    @Test
    fun testReverseInPlace_Wrap() {
        val list = MutableList(10, {it})
        list.reverse(7, 6)
        assertEquals(mutableListOf(9, 8, 7, 3, 4, 5, 6, 2, 1, 0), list)
    }
}