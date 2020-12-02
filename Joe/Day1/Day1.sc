import scala.io.Source

val input = Source.fromFile("input.txt").getLines().map(_.toInt).toList

input.combinations(2).collectFirst {
    case List(a, b) if a + b == 2020 => println(a * b)
  }

input.combinations(3).collectFirst {
    case List(a, b, c) if a + b + c == 2020 => println(a * b * c)
  }

def recur1: (Int, List[Int]) => Option[Int] = {
    case (target, head :: tail) =>
      if (tail.contains(target - head)) Some(head * (target - head)) else recur1(target, tail)
    case (_, Nil) => None
  }

def recur2: (Int, List[Int]) => Option[Int] = {
    case (target, head :: tail) =>
      recur1(target - head, tail).fold(recur2(target, tail))(x => Some(x * head))
    case (_, Nil) => None
  }

println(recur1(2020, input))
println(recur2(2020, input))