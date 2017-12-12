import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class Problem4Tests {

    @Test
    fun testPartA_Input() {
        val problem = Problem4()
        problem.loadInputFromFile("./input/4.txt")
        assertEquals(325, problem.partA())
    }

    @Test
    fun testPartB_Input() {
        val problem = Problem4()
        problem.loadInputFromFile("./input/4.txt")
        assertEquals(119, problem.partB())
    }

    @Test
    fun testIsValid() {
        assertTrue(Problem4.isValid("aa bb cc dd ee"))
        assertFalse(Problem4.isValid("aa bb cc dd aa"))
        assertTrue(Problem4.isValid("aa bb cc dd aaa"))
    }

    @Test
    fun testIsValid_SuperSecure() {
        assertTrue(Problem4.isValid("abcde fghij", true))
        assertFalse(Problem4.isValid("abcde xyz ecdab", true))
        assertTrue(Problem4.isValid("a ab abc abd abf abj", true))
        assertTrue(Problem4.isValid("iiii oiii ooii oooi oooo", true))
        assertFalse(Problem4.isValid(" oiii ioii iioi iiio", true))
    }
}