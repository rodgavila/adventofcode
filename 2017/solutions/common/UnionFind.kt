package common

abstract class UnionFind(val n:Int) {
    abstract fun find(u: Int, v: Int): Boolean
    abstract fun union(u: Int, v: Int)
    abstract fun listGroups(): List<Set<Int>>
}

class QuickUnion(n: Int) : UnionFind(n) {
    private val data: MutableList<Int> = MutableList(n, {it})

    override fun find(u: Int, v: Int): Boolean {
        return root(u) == root(v)
    }

    override fun union(u: Int, v: Int) {
        if (u == v) {
            return
        }

        val i = root(u)
        val j = root(v)
        data[j] = i
    }

    override fun listGroups(): List<Set<Int>> {
        val returnMap = mutableMapOf<Int, MutableSet<Int>>()
        for (e in data) {
            val root = root(e)

            if (returnMap[root] == null) {
                returnMap[root] = mutableSetOf()
            }

            returnMap[root]!!.add(e)
        }

        return returnMap.values.toList()
    }

    private fun root(n: Int): Int {
        var root = n
        while (root != data[root]) {
            root = data[root]
        }

        return root
    }
}
