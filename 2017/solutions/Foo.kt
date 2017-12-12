class Foo {
    companion object {
        @JvmStatic lateinit var runnable: Runnable
    }

    constructor() {
        runnable = Runnable {  }
    }

    fun bar(c:Int) {
        runnable = Runnable { Thread.sleep(222) }
    }
}


class Baz {
    constructor() {
        Foo.runnable = Runnable { throw IllegalArgumentException("Muaha") }
    }
}