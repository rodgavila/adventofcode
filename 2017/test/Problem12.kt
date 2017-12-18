import org.junit.Test
import kotlin.test.assertEquals

class Problem12Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem12()
        problem.loadInputFromFile("./input/12sample.txt")
        assertEquals(6, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem12()
        problem.loadInputFromFile("./input/12.txt")
        assertEquals(720, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem12()
        problem.loadInputFromFile("./input/12sample.txt")
        assertEquals(2, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem12()
        problem.loadInputFromFile("./input/12.txt")
        assertEquals(200, problem.partB())
    }
}