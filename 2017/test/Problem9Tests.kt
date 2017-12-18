import org.junit.Test
import java.util.Scanner
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class Problem9Tests {

    @Test
    fun testPartA_Sample1() {
        val problem = Problem9()
        problem.input = "{{{},{},{{}}}}"
        assertEquals(16, problem.partA())
    }

    @Test
    fun testPartA_Sample2() {
        val problem = Problem9()
        problem.input = "{<a>,<a>,<a>,<a>}"
        assertEquals(1, problem.partA())
    }

    @Test
    fun testPartA_Sample3() {
        val problem = Problem9()
        problem.input = "{{<ab>},{<ab>},{<ab>},{<ab>}}"
        assertEquals(9, problem.partA())
    }

    @Test
    fun testPartA_Sample4() {
        val problem = Problem9()
        problem.input = "{{<!!>},{<!!>},{<!!>},{<!!>}}"
        assertEquals(9, problem.partA())
    }

    @Test
    fun testPartA_Sample5() {
        val problem = Problem9()
        problem.input = "{{<a!>},{<a!>},{<a!>},{<ab>}}"
        assertEquals(3, problem.partA())
    }

    @Test
    fun testPartA_Input() {
        val problem = Problem9()
        problem.loadInputFromFile("./input/9.txt")
        assertEquals(11347, problem.partA())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem9()
        problem.loadInputFromFile("./input/9.txt")
        assertEquals(5404, problem.partB())
    }

    @Test
    fun testGarbagePattern() {
        // empty garbage
        assertIsGarbage("<>")

        // garbage containing random characters.
        assertIsGarbage("<909f8we90rmw9028349m>")

        // because the extra < are ignored.
        assertIsGarbage("<<<<>")

        // because the first > is canceled.
        assertIsGarbage("<{!>}>")

        // because the second ! is canceled, allowing the > to terminate the garbage.
        assertIsGarbage("<!!>")

        // because the second ! and the first > are canceled.
        assertIsGarbage("<!!!>>")

        // which ends at the first >.
        assertIsGarbage("<{o\"i!a,<{i<a>")

        // With curly braces
        assertIsGarbage("<!>},{<!>},{<!>},{<a>")
    }

    private fun assertIsGarbage(string: String) {
        val scanner = Scanner(string)
        assertTrue(scanner.hasNext(Problem9.GARBAGE_PATTERN))
        assertEquals(string, scanner.next(Problem9.GARBAGE_PATTERN))
    }

    @Test
    fun testClean() {
        assertEquals("{{},{},{},{}}", Problem9.clean("{{<a>},{<a>},{<a>},{<a>}}"))
        assertEquals(4, Problem9.countGarbageGroups("{{<a>},{<a>},{<a>},{<a>}}"))
        assertEquals(0, Problem9.countCanceledCharacters("{{<a>},{<a>},{<a>},{<a>}}"))

        assertEquals("{{}}", Problem9.clean("{{<!>},{<!>},{<!>},{<a>}}"))
        assertEquals(1, Problem9.countGarbageGroups("{{<!>},{<!>},{<!>},{<a>}}"))
        assertEquals(3, Problem9.countCanceledCharacters("{{<!>},{<!>},{<!>},{<a>}}"))
    }
}