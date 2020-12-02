import scala.io.Source

val input = Source.fromFile("input.txt").getLines().map(_.toInt).toList

input.combinations(2).collectFirst {
    case List(a, b) if a + b == 2020 => println(a * b)
  }

input.combinations(3).collectFirst {
    case List(a, b, c) if a + b + c == 2020 => println(a * b * c)
  }
