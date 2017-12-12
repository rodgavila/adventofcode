import org.junit.Test
import kotlin.test.assertEquals

class Problem1Tests {

    @Test
    fun testPartA_Sample1() {
        val problem = Problem1()
        problem.input = "1122"
        assertEquals(3, problem.partA())
    }

    @Test
    fun testPartA_Sample2() {
        val problem = Problem1()
        problem.input = "1111"
        assertEquals(4, problem.partA())
    }

    @Test
    fun testPartA_Sample3() {
        val problem = Problem1()
        problem.input = "1234"
        assertEquals(0, problem.partA())
    }

    @Test
    fun testPartA_Sample4() {
        val problem = Problem1()
        problem.input = "91212129"
        assertEquals(9, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem1()
        problem.loadInputFromFile("./input/1.txt")
        assertEquals(995, problem.partA())
    }

    @Test
    fun testPartB_Sample1() {
        val problem = Problem1()
        problem.input = "1212"
        assertEquals(6, problem.partB())
    }

    @Test
    fun testPartB_Sample2() {
        val problem = Problem1()
        problem.input = "1221"
        assertEquals(0, problem.partB())
    }

    @Test
    fun testPartB_Sample3() {
        val problem = Problem1()
        problem.input = "123425"
        assertEquals(4, problem.partB())
    }

    @Test
    fun testPartB_Sample4() {
        val problem = Problem1()
        problem.input = "123123"
        assertEquals(12, problem.partB())
    }

    @Test
    fun testPartB_Sample5() {
        val problem = Problem1()
        problem.input = "12131415"
        assertEquals(4, problem.partB())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem1()
        problem.loadInputFromFile("./input/1.txt")
        assertEquals(1130, problem.partB())
    }
}