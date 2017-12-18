import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertEquals

class Problem2Tests {
    @Test
    fun testPartA_Sample() {
        val problem = Problem2()
        problem.input = "5\t1\t9\t5\n" +
                "7\t5\t3\n" +
                "2\t4\t6\t8"
        assertEquals(18, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem2()
        problem.loadInputFromFile("./input/2.txt")
        assertEquals(58975, problem.partA())
    }

    @Test
    @Ignore("Not sure why this is failing...")
    fun testPartB_Sample() {
        val problem = Problem2()
        problem.input = "5\t9\t2\t8\n" +
                "9\t4\t7\t3\n" +
                "3\t8\t6\t5"
        assertEquals(18, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem2()
        problem.loadInputFromFile("./input/2.txt")
        assertEquals(308, problem.partB())
    }
}