import java.text.ParseException
import java.util.Scanner
import kotlin.math.max

class Problem8 : Problem() {
    override fun partA(): Any {
        val scanner = Scanner(input)
        val instructions = mutableListOf<Instruction>()

        while (scanner.hasNextLine()) {
            instructions.add(Parser.parse(scanner.nextLine()))
        }

        val machine = Machine()
        machine.instructions.addAll(instructions)
        machine.run()

        return machine.registers.values.max() ?: 0
    }

    override fun partB(): Any {
        val scanner = Scanner(input)
        val instructions = mutableListOf<Instruction>()

        while (scanner.hasNextLine()) {
            instructions.add(Parser.parse(scanner.nextLine()))
        }

        val machine = Machine()
        machine.instructions.addAll(instructions)
        machine.run()

        return machine.maxValueEverHold
    }

    class Parser {
        companion object {
            val REG_PATTERN = Regex("\\b\\p{Lower}+\\b").toPattern()
            val INS_PATTERN = Regex("\\b(inc|dec)\\b").toPattern()
            val OPERATOR_PATTERN = Regex("(>|>=|<|<=|==|!=)").toPattern()
            val IF_PATTERN = Regex("\\bif\\b").toPattern()

            fun parse(instruction: String): Instruction {
                val scanner = Scanner(instruction)

                val r: String?
                val ins: String?
                val op: Int?
                val lhs: String?
                val cop: String?
                val rhs: Int?

                if (!scanner.hasNext(REG_PATTERN)) {
                    throw ParseException("Register expected", 0)
                }
                r = scanner.next(REG_PATTERN)

                if (!scanner.hasNext(INS_PATTERN)) {
                    throw ParseException("Register expected", 0)
                }
                ins = scanner.next(INS_PATTERN)

                if (!scanner.hasNextInt()) {
                    throw ParseException("Number expected", 0)
                }
                op = scanner.nextInt()

                if (!scanner.hasNext(IF_PATTERN)) {
                    throw ParseException("if expected", 0)
                }
                scanner.next(IF_PATTERN)

                if (!scanner.hasNext(REG_PATTERN)) {
                    throw ParseException("Register expected", 0)
                }
                lhs = scanner.next(REG_PATTERN)

                if (!scanner.hasNext(OPERATOR_PATTERN)) {
                    throw ParseException("Operator expected", 0)
                }
                cop = scanner.next(OPERATOR_PATTERN)

                if (!scanner.hasNextInt()) {
                    throw ParseException("Number expected", 0)
                }
                rhs = scanner.nextInt()

                if (scanner.hasNext()) {
                    throw ParseException("EOL expected", 0)
                }

                val statement = Statement(StatementOperator.parse(ins), r, op)
                val condition = Expression(ExpressionOperator.parse(cop), lhs, rhs)

                return Instruction(statement, condition)
            }
        }
    }

    class Machine {
        var instructions = mutableListOf<Instruction>()
        val registers = mutableMapOf<String, Int>()
        var maxValueEverHold = Integer.MIN_VALUE

        fun run() {
            instructions.forEach {
                executeInstruction(it)
            }
        }

        private fun updateStats() {
            registers.values.max()?.let {
                maxValueEverHold = max(it, maxValueEverHold)
            }
        }

        private fun executeInstruction(instruction: Instruction) {
            if (evalueExpression(instruction.condition)) {
                with (instruction.statement) {
                    registers[op1] = registers[op1] ?: 0
                    registers[op1] = when (operator) {
                        StatementOperator.INC -> registers[op1]!! + op2
                        StatementOperator.DEC -> registers[op1]!! - op2
                    }
                }

                updateStats()
            }
        }

        private fun evalueExpression(condition: Expression): Boolean {
            with (condition) {
                val op1Value = registers[op1] ?: 0

                return when (operator) {
                    ExpressionOperator.GT -> op1Value > op2
                    ExpressionOperator.GTE -> op1Value >= op2
                    ExpressionOperator.LT -> op1Value < op2
                    ExpressionOperator.LTE -> op1Value <= op2
                    ExpressionOperator.EQ -> op1Value == op2
                    ExpressionOperator.NEQ -> op1Value != op2
                }
            }
        }
    }

    class Instruction(val statement: Statement, val condition: Expression)

    class Statement(val operator: StatementOperator, val op1: String, val op2: Int)
    class Expression(val operator: ExpressionOperator, val op1: String, val op2: Int)

    enum class StatementOperator(val lexeme: String) {
        INC("inc"),
        DEC("dec");

        companion object {
            fun parse(lexeme: String): StatementOperator =
                    values().find { it.lexeme == lexeme } ?: throw IllegalArgumentException("Wrong operator: $lexeme")
        }
    }

    enum class ExpressionOperator(val lexeme: String) {
        GT(">"),
        LT("<"),
        GTE(">="),
        LTE("<="),
        EQ("=="),
        NEQ("!=");

        companion object {
            fun parse(lexeme: String): ExpressionOperator =
                    values().find { it.lexeme == lexeme } ?: throw IllegalArgumentException("Wrong operator: $lexeme")
        }
    }
}