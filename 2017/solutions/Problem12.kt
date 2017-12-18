import common.QuickUnion
import java.util.Scanner

class Problem12 : Problem() {
    override fun partA(): Any {
        val scanner = Scanner(input)
        val list = mutableListOf<String>()

        while (scanner.hasNextLine()) {
            list.add(scanner.nextLine())
        }

        val unionFind = QuickUnion(list.size)

        for (line in list) {
            val numbers = line.split("<->")

            val program = numbers[0].trim().toInt()
            val connected = numbers[1].split(",").map { it.trim().toInt() }

            for (p in connected) {
                unionFind.union(program, p)
            }
        }

        val connectedToZero = mutableListOf<Int>()

        for (i in 0 until list.size) {
            if (unionFind.find(0, i)) {
                connectedToZero.add(i)
            }
        }

        return connectedToZero.size
    }

    override fun partB(): Any {
        val scanner = Scanner(input)
        val list = mutableListOf<String>()

        while (scanner.hasNextLine()) {
            list.add(scanner.nextLine())
        }

        val unionFind = QuickUnion(list.size)

        for (line in list) {
            val numbers = line.split("<->")

            val program = numbers[0].trim().toInt()
            val connected = numbers[1].split(",").map { it.trim().toInt() }

            for (p in connected) {
                unionFind.union(program, p)
            }
        }

        return unionFind.listGroups().size
    }
}