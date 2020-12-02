import scala.io.Source

val input = Source.fromFile("input.txt").getLines().toList

val pattern = """(\d+)-(\d+) (\w): (\w+)""".r

println(input.count {
    case pattern(min, max, c, pwd) =>
      val count = pwd.count(_ == c.head)
      count >= min.toInt && count <= max.toInt
  })

println(input.count {
    case pattern(a, b, c, pwd) =>
      val posA = pwd.charAt(a.toInt - 1) == c.head
      val posB = pwd.charAt(b.toInt - 1) == c.head
      posA ^ posB
  })
