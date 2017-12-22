import common.KnotHash
import common.toBitSetBigEndian

class Problem14 : Problem() {
    override fun partA(): Any {
        val key = input

        var useSquares = 0
        for (i in 0..127) {
            val rowKey = "$key-$i"
            val inputByteArray = ByteArray(rowKey.length)
            rowKey.forEachIndexed {index, value -> inputByteArray[index] = value.toByte()}

            val rowHash = KnotHash(inputByteArray).computeHash()
            val rowBitSet = rowHash.toBitSetBigEndian()

            useSquares += rowBitSet.cardinality()
        }

        return useSquares
    }

    override fun partB(): Any {
        val key = input

        val usedMatrix = Array(128) { Array(128) { false }}
        val groupsMatrix = Array(128) { Array(128) { 0 }}

        for (i in 0..127) {
            val rowKey = "$key-$i"
            val inputByteArray = ByteArray(rowKey.length)
            rowKey.forEachIndexed {index, value -> inputByteArray[index] = value.toByte()}

            val rowHash = KnotHash(inputByteArray).computeHash()
            val rowBitSet = rowHash.toBitSetBigEndian()

            for (j in 0..127) {
                usedMatrix[i][j] = rowBitSet.get(j)
            }
        }

        var currentGroup = 1
        for (i in 0..127) {
            for (j in 0..127) {
                if (explore(usedMatrix, groupsMatrix, i, j, currentGroup)) {
                    currentGroup++
                }
            }
        }

        return (currentGroup -1)
    }

    private fun explore(usedMatrix: Array<Array<Boolean>>,
                        groupsMatrix: Array<Array<Int>>,
                        i: Int, j: Int,
                        currentGroup: Int): Boolean {
        // If sector isn't used or it's part of another group skip it
        if (!usedMatrix[i][j] || groupsMatrix[i][j] != 0) {
            return false
        }

        groupsMatrix[i][j] = currentGroup

        if (i > 0) {
            explore(usedMatrix, groupsMatrix, i-1, j, currentGroup)
        }

        if (i < (usedMatrix.size-1)) {
            explore(usedMatrix, groupsMatrix, i+1, j, currentGroup)
        }

        if (j > 0) {
            explore(usedMatrix, groupsMatrix, i, j-1, currentGroup)
        }

        if (j < (usedMatrix.size-1)) {
            explore(usedMatrix, groupsMatrix, i, j+1, currentGroup)
        }

        return true
    }

    private inline fun <reified T> printMatrix(matrix: Array<Array<T>>) {
        for (i in 0..127) {
            for (j in 0..127) {
                when (T::class) {
                    Boolean::class -> print(if (matrix[i][j] as Boolean) '#' else '.')
                    else -> print(matrix[i][j])
                }

            }
            println()
        }
    }
}