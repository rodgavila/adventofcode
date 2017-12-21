package common

/**
 * Reverses a part of the list in place.
 *
 * @param fromIndex first element to reverse
 * @param numElements number of elements to reverse (if numElements is greater than the size of the list, it will wrap
 * as if it was a circular list
 */
fun <T> MutableList<T>.reverse(fromIndex: Int, numElements: Int) {
    val sublist = mutableListOf<T>()

    for (i in 0 until numElements) {
        sublist.add(this[(fromIndex + i).rem(this.size)])
    }

    sublist.reverse()

    for (i in 0 until numElements) {
        this[(fromIndex + i).rem(this.size)] = sublist[i]
    }
}