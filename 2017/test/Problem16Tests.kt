import org.junit.Test
import kotlin.test.assertEquals

class Problem16Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem16()
        problem.loadInputFromFile("./input/16sample.txt")
        problem.extraInput = 5
        assertEquals("baedc", problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem16()
        problem.loadInputFromFile("./input/16.txt")
        problem.extraInput = 16
        assertEquals("fnloekigdmpajchb", problem.partA())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem16()
        problem.loadInputFromFile("./input/16.txt")
        problem.extraInput = 16
        assertEquals("amkjepdhifolgncb", problem.partB())
    }
}