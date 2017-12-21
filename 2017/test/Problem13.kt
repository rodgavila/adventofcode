import org.junit.Test
import kotlin.test.assertEquals

class Problem13Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem13()
        problem.loadInputFromFile("./input/13sample.txt")
        assertEquals(24, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem13()
        problem.loadInputFromFile("./input/13.txt")
        assertEquals(1844, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem13()
        problem.loadInputFromFile("./input/13sample.txt")
        assertEquals(10, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem13()
        problem.loadInputFromFile("./input/13.txt")
        assertEquals(3897604, problem.partB())
    }
}