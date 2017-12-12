import org.junit.Test
import kotlin.test.assertEquals

class Problem5Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem5()
        problem.loadInputFromFile("./input/5sample.txt")
        assertEquals(5, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem5()
        problem.loadInputFromFile("./input/5.txt")
        assertEquals(358131, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem5()
        problem.loadInputFromFile("./input/5sample.txt")
        assertEquals(10, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem5()
        problem.loadInputFromFile("./input/5.txt")
        assertEquals(25558839, problem.partB())
    }
}