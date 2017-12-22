import org.junit.Test
import kotlin.test.assertEquals

class Problem17Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem17()
        problem.input = "3"
        problem.extraInput = 2017
        assertEquals(638, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem17()
        problem.input = "380"
        problem.extraInput = 2017
        assertEquals(204, problem.partA())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem17()
        problem.input = "380"
        problem.extraInput = 50_000_000
        assertEquals(28954211, problem.partB())
    }
}