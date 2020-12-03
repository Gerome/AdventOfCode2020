import scala.io.Source

val input = Source.fromFile("input.txt").getLines().toList

val slopes = Set((1, 1), (3, 1), (5, 1), (7, 1), (1, 2))

def solution: (List[String], (Int, Int)) => Int = {
    case (input, (right, down)) =>
      input
        .grouped(down)
        .foldLeft((0, 0))({
          case ((idx, total), line) =>
            (idx + right, total + (if (line.head.charAt(idx % line.head.length) == '#') 1 else 0))
        })
        ._2
  }

def part2: Long = slopes.map(solution(input, _).toLong).product

var pos = 0
def solutionSimpler: List[String] => Int = {
  _.count{l =>
    val x = l.charAt(pos%l.length) == '#'
    pos = pos + 3
    x
  }
}

println(solution(input,(3,1)))
println(part2)