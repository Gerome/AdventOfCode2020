import scala.io.Source

val input = Source.fromFile("input.txt").getLines().toList

val pattern = """(\d+)-(\d+) (\w): (\w+)""".r

def countValid1: List[String] => Int =
    _.count {
      case pattern(min, max, c, pwd) =>
        val count = pwd.count(_ == c.head)
        count >= min.toInt && count <= max.toInt
    }

def countValid2: List[String] => Int =
    _.count {
      case pattern(a, b, c, pwd) =>
        val posA = pwd.charAt(a.toInt - 1) == c.head
        val posB = pwd.charAt(b.toInt - 1) == c.head
        posA ^ posB
    }

def getComponents: String => (Int, Int, Char, String) = { line =>
    val parts = line.split(Array('-', ' ', ':'))
    (parts(0).toInt, parts(1).toInt, parts(2).head, parts(4))
  }

def countValid1NoRegex: List[String] => Int =
    _.count { line =>
      val (min, max, c, pwd) = getComponents(line)
      val count              = pwd.count(_ == c)
      count >= min.toInt && count <= max.toInt
    }

def countValid2NoRegex: List[String] => Int =
    _.count { line =>
      val (a, b, c, pwd) = getComponents(line)
      val posA           = pwd.charAt(a - 1) == c
      val posB           = pwd.charAt(b - 1) == c
      posA ^ posB
    }

println(countValid1(input))
println(countValid2(input))
println(countValid1NoRegex(input))
println(countValid2NoRegex(input))
