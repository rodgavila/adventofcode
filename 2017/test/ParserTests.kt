import org.junit.Test
import kotlin.test.assertEquals

class ParserTests {

    @Test
    fun testInc() {
        val instruction = Problem8.Parser.parse("b inc 5 if a > 1")
        assertEquals("b", instruction.statement.op1)
        assertEquals(Problem8.StatementOperator.INC, instruction.statement.operator)
        assertEquals(5, instruction.statement.op2)

        assertEquals("a", instruction.condition.op1)
        assertEquals(Problem8.ExpressionOperator.GT, instruction.condition.operator)
        assertEquals(1, instruction.condition.op2)
    }

    @Test
    fun testDec() {
        val instruction = Problem8.Parser.parse("c dec -10 if a >= 1")
        assertEquals("c", instruction.statement.op1)
        assertEquals(Problem8.StatementOperator.DEC, instruction.statement.operator)
        assertEquals(-10, instruction.statement.op2)

        assertEquals("a", instruction.condition.op1)
        assertEquals(Problem8.ExpressionOperator.GTE, instruction.condition.operator)
        assertEquals(1, instruction.condition.op2)
    }
}