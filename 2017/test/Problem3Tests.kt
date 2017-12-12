import org.junit.Test
import kotlin.test.assertEquals

class Problem3Tests {

    @Test
    fun getRingOf() {
        assertEquals(3, Problem3.getRingOf(27))
        assertEquals(3, Problem3.getRingOf(49))
        assertEquals(4, Problem3.getRingOf(50))
        assertEquals(4, Problem3.getRingOf(77))
    }

    @Test
    fun testGenerateSequence5() {
        val sequence = Problem3.generateSequence(3)

        assertEquals(listOf(5, 4, 3, 4, 5, 6), sequence)
    }

    @Test
    fun testGenerateSequence7() {
        val sequence = Problem3.generateSequence(4)

        assertEquals(listOf(7, 6, 5, 4, 5, 6, 7, 8), sequence)
    }

    @Test
    fun testPartA_Sample1() {
        val problem = Problem3()
        problem.input = "1"
        assertEquals(0, problem.partA())
    }

    @Test
    fun testPartA_Sample2() {
        val problem = Problem3()
        problem.input = "12"
        assertEquals(3, problem.partA())
    }

    @Test
    fun testPartA_Sample3() {
        val problem = Problem3()
        problem.input = "23"
        assertEquals(2, problem.partA())
    }

    @Test
    fun testPartA_Sample4() {
        val problem = Problem3()
        problem.input = "49"
        assertEquals(6, problem.partA())
    }

    @Test
    fun testPartA_Sample5() {
        val problem = Problem3()
        problem.input = "1024"
        assertEquals(31, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem3()
        problem.input = "368078"
        assertEquals(371, problem.partA())
    }

    @Test
    fun testPartB_Sample() {
        val problem = Problem3()
        problem.input = "54"
        assertEquals(57, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem3()
        problem.input = "368078"
        assertEquals(369601, problem.partB())
    }

    @Test
    fun testSumOfAdjacent() {
        assertEquals(
                8,
                Problem3.sumOfAdjacent(Pair(0, 0), mapOf(Pair(-1, -1) to 3, Pair(1, 1) to 5)))
    }

    @Test
    fun testSpiralSequence() {
        assertEquals(listOf(Pair(0,0)), spiralSequence().take(1).toList())
        assertEquals(listOf(Pair(1,-2)), spiralSequence().drop(23).take(1).toList())
    }

}