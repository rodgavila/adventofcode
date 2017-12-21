import common.QuickUnion
import java.util.ArrayList
import java.util.LinkedList
import java.util.Scanner

class Problem13 : Problem() {
    override fun partA(): Any {
        val scanner = Scanner(input)
        val securityScanners = mutableMapOf<Int, Int>()

        while (scanner.hasNextLine()) {
            val data = scanner.nextLine().split(":")
            val depth = data[0].trim().toInt()
            val range = data[1].trim().toInt()
            securityScanners[depth] = range
        }

        val maxDepth = securityScanners.keys.max()!!
        var damage = 0
        val securityScannerPositions = securityScanners.toMutableMap()
        val securityScannerDirections = securityScanners.toMutableMap()
        securityScannerPositions.forEach { t, _ -> securityScannerPositions[t] = 0 }
        securityScannerDirections.forEach { t, _ -> securityScannerDirections[t] = 1 }

        for (currentDepth in 0..maxDepth) {
            // Is the a scanner at the current depth and is the scanner currently at the top level?
            if (securityScanners.containsKey(currentDepth) && securityScannerPositions[currentDepth] == 0) {
                damage += currentDepth * securityScanners[currentDepth]!!
            }

            // Move scanner
            securityScannerPositions.forEach { t, u ->
                // Did we reach the bottom?
                if (u==securityScanners[t]!!-1) {
                    securityScannerDirections[t] = -1
                } else if (u==0) {
                    securityScannerDirections[t] = 1
                }

                securityScannerPositions[t] = u + securityScannerDirections[t]!!
            }
        }

        return damage
    }

    override fun partB(): Any {
        val scanner = Scanner(input)
        val securityScanners = mutableMapOf<Int, Int>()

        while (scanner.hasNextLine()) {
            val data = scanner.nextLine().split(":")
            val depth = data[0].trim().toInt()
            val range = data[1].trim().toInt()
            securityScanners[depth] = range
        }

        val maxDepth = securityScanners.keys.max()!!
        val securityScannerPositions = securityScanners.toMutableMap()
        val securityScannerDirections = securityScanners.toMutableMap()
        securityScannerPositions.forEach { t, _ -> securityScannerPositions[t] = 0 }
        securityScannerDirections.forEach { t, _ -> securityScannerDirections[t] = 1 }

        var delay = 0
        val probes = LinkedList<Int>()
        while(true) {
            probes.addFirst(delay)

            probes.forEachIndexed { index, value ->
                if (value != -1 && securityScanners.containsKey(index)
                        && securityScannerPositions[index] == 0) {
                    // Probe is dead!
                    probes[index] = -1
                }
            }

            // Move scanner
            securityScannerPositions.forEach { t, u ->
                // Did we reach the bottom?
                if (u == securityScanners[t]!! - 1) {
                    securityScannerDirections[t] = -1
                } else if (u == 0) {
                    securityScannerDirections[t] = 1
                }

                securityScannerPositions[t] = u + securityScannerDirections[t]!!
            }

            if (probes.size > maxDepth && probes[maxDepth] != -1) {
                return probes[maxDepth]
            }

            if (probes.size > (maxDepth+1)) {
                probes.removeLast()
            }

            delay++
        }
    }
}