import org.junit.Test
import kotlin.test.assertEquals

class Problem7Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem7()
        problem.loadInputFromFile("./input/7sample.txt")
        assertEquals("tknk", problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem7()
        problem.loadInputFromFile("./input/7.txt")
        assertEquals("cqmvs", problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem7()
        problem.loadInputFromFile("./input/7sample.txt")
        assertEquals(60, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem7()
        problem.loadInputFromFile("./input/7.txt")
        assertEquals(2310, problem.partB())
    }
}