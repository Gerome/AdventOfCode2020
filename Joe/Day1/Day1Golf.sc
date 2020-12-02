import scala.io.Source

print(Source.fromFile("i").getLines().map(_.toInt).toSeq.combinations(2).collectFirst{case Seq(a,b)if a+b==2020=>a*b})

print(Source.fromFile("i").getLines().map(_.toInt).toSeq.combinations(3).collectFirst{case Seq(a,b,c)if a+b+c==2020=>a*b*c})
