import scala.io.Source

print(Source.fromFile("i").getLines().map(_.toInt).toSeq.combinations(2).collectFirst{case Seq(a,b)if a+b==2020=>a*b})