import java.util.Scanner

class Problem7 : Problem() {
    override fun partA(): Any {
        val root = generateTree()
        return root.name
    }

    override fun partB(): Any {
        val root = generateTree()
        return findRootImbalance(root)
    }

    private fun findRootImbalance(node: Node): Int {
        if (node.isBalanced()) {
            throw IllegalArgumentException("Can't find imbalance on a balanced tree!")
        }

        val childrenByWeight = node.children.groupBy { it.weightIncludingDescendants() }
        val offChild = childrenByWeight.filterValues { it.size == 1 }.values.first().first()
        val otherChildren = childrenByWeight.filterValues { it.size > 1 }

        return if (offChild.isBalanced()) {
            offChild.weight + (otherChildren.keys.first() - offChild.weightIncludingDescendants())
        } else {
            findRootImbalance(offChild)
        }
    }

    private fun generateTree() : Node {
        val programs = mutableMapOf<String, Node>()

        // First pass, just get names and weight
        var scanner = Scanner(input)
        while (scanner.hasNextLine()) {
            val line = scanner.nextLine()
            val words = line.split(" ")
            val name = words[0].trim()
            val weight = words[1].substring(1, words[1].length-1).toInt()

            programs[name] = Node(name, weight)
        }

        // Second pass, generate the tree
        scanner = Scanner(input)
        val candidateRoots = programs.keys.toMutableSet()
        while (scanner.hasNextLine()) {
            val line = scanner.nextLine()
            val words = line.split(" ")
            val parent = words[0].trim()

            if (line.contains("->")) {
                val children = line.substringAfter("->").split(",").map { it.trim() }

                children.forEach {
                    val child = programs[it]!!
                    candidateRoots.remove(it)

                    if (programs[parent] == null) {
                        throw IllegalArgumentException("Missing parent: ${parent}")
                    } else {
                        programs[parent]!!.children.add(child)
                    }
                }
            }
        }

        if (candidateRoots.size > 1) {
            throw IllegalArgumentException("Forest found!")
        }

        return programs[candidateRoots.first()]!!
    }

    private class Node(val name: String, val weight: Int, val children: MutableList<Node> = mutableListOf()) {
        override fun equals(other: Any?): Boolean{
            if (this === other) return true
            if (other?.javaClass != javaClass) return false

            other as Node

            return name == other.name
        }

        override fun hashCode(): Int {
            return name.hashCode()
        }

        fun weightIncludingDescendants():Int {
            var sum = 0
            children.forEach {
                sum += it.weightIncludingDescendants()
            }

            return weight + sum
        }

        fun isBalanced(): Boolean {
            return (children.map { it.weightIncludingDescendants() }.distinct().size == 1)
        }
    }
}