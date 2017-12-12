import org.junit.Test
import kotlin.test.assertEquals

class Problem6Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem6()
        problem.loadInputFromFile("./input/6sample.txt")
        assertEquals(5, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem6()
        problem.loadInputFromFile("./input/6.txt")
        assertEquals(7864, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem6()
        problem.loadInputFromFile("./input/6sample.txt")
        assertEquals(4, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem6()
        problem.loadInputFromFile("./input/6.txt")
        assertEquals(1695, problem.partB())
    }

    @Test
    fun testRedistribute() {
        val list = mutableListOf(0, 2, 7, 0)

        Problem6.redistribute(list)
        assertEquals(mutableListOf(2, 4, 1, 2), list)

        Problem6.redistribute(list)
        assertEquals(mutableListOf(3, 1, 2, 3), list)
    }
}