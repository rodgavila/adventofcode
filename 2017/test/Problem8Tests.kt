import org.junit.Test
import kotlin.test.assertEquals

class Problem8Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem8()
        problem.loadInputFromFile("./input/8sample.txt")
        assertEquals(1, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem8()
        problem.loadInputFromFile("./input/8.txt")
        assertEquals(4902, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem8()
        problem.loadInputFromFile("./input/8sample.txt")
        assertEquals(10, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem8()
        problem.loadInputFromFile("./input/8.txt")
        assertEquals(7037, problem.partB())
    }
}