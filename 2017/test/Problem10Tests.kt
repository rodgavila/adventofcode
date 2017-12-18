import org.junit.Test
import kotlin.test.assertEquals

class Problem10Tests {

    @Test
    fun testPartA_Sample() {
        val problem = Problem10()
        problem.input = "3,4,1,5"
        problem.input2 = 5
        assertEquals(12, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem10()
        problem.input2 = 256
        problem.loadInputFromFile("./input/10.txt")
        assertEquals(38628, problem.partA())
    }

    @Test
    fun testPartB_Sample1() {
        val problem = Problem10()
        problem.input = ""
        problem.input2 = 256
        assertEquals("a2582a3a0e66e6e86e3812dcb672a272", problem.partB())
    }

    @Test
    fun testPartB_Sample2() {
        val problem = Problem10()
        problem.input = "AoC 2017"
        problem.input2 = 256
        assertEquals("33efeb34ea91902bb2f59c9920caa6cd", problem.partB())
    }

    @Test
    fun testPartB_Sample3() {
        val problem = Problem10()
        problem.input = "1,2,3"
        problem.input2 = 256
        assertEquals("3efbe78a8d82f29979031a4aa0b16a9d", problem.partB())
    }

    @Test
    fun testPartB_Sample4() {
        val problem = Problem10()
        problem.input = "1,2,4"
        problem.input2 = 256
        assertEquals("63960835bcdc130f0b66d7ff4f6a5a8e", problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem10()
        problem.input2 = 256
        problem.loadInputFromFile("./input/10.txt")
        assertEquals("e1462100a34221a7f0906da15c1c979a", problem.partB())
    }

    @Test
    fun testReverseInPlace_Middle() {
        val list = MutableList(5, {it})
        list.reverse(1, 3)
        assertEquals(mutableListOf(0, 3, 2, 1, 4), list)
    }

    @Test
    fun testReverseInPlace_Wrap() {
        val list = MutableList(10, {it})
        list.reverse(7, 6)
        assertEquals(mutableListOf(9, 8, 7, 3, 4, 5, 6, 2, 1, 0), list)
    }
}