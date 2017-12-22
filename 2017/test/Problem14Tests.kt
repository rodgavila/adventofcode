import org.junit.Test
import kotlin.test.assertEquals

class Problem14Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem14()
        problem.input = "flqrgnkx"
        assertEquals(8108, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem14()
        problem.input = "xlqgujun"
        assertEquals(8204, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem14()
        problem.input = "flqrgnkx"
        assertEquals(1242, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem14()
        problem.input = "xlqgujun"
        assertEquals(1089, problem.partB())
    }
}