import scala.io.Source

print(Source.fromFile("i").getLines().map(_.toInt).toList.combinations(2).collectFirst{case List(a,b)if a+b==2020=>a*b})

print(Source.fromFile("i").getLines().map(_.toInt).toList.combinations(3).collectFirst{case List(a,b,c)if a+b+c==2020=>a*b*c})
