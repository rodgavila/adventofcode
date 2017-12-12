import java.util.Scanner

class Problem2 : Problem() {

    override fun partA(): Any {
        val scanner = Scanner(input)
        var checksum = 0

        while (scanner.hasNextLine()) {
            var max = Integer.MIN_VALUE
            var min = Integer.MAX_VALUE

            with(Scanner(scanner.nextLine())) {
                while (hasNextInt()) {
                    val num = nextInt()
                    if (num > max)
                        max = num

                    if (num < min)
                        min = num
                }
            }

            checksum += (max - min)
        }

        return checksum
    }

    override fun partB(): Any {
        val scanner = Scanner(input)
        var checksum = 0

        while (scanner.hasNextLine()) {
            val list = mutableListOf<Int>()

            with(Scanner(scanner.nextLine())) {
                while (hasNextInt()) {
                    list.add(nextInt())
                }
            }

            list.forEach { a ->
                list.forEach { b ->
                    if (a != b && a % b == 0) {
                        checksum += a / b
                    }
                }
            }
        }

        return checksum
    }
}