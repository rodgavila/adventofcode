import org.junit.Test
import kotlin.test.assertEquals

class Problem15Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem15()
        problem.input = "65, 8921"
        assertEquals(588, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem15()
        problem.input = "516, 190"
        assertEquals(597, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem15()
        problem.input = "65, 8921"
        assertEquals(309, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem15()
        problem.input = "516, 190"
        assertEquals(303, problem.partB())
    }
}