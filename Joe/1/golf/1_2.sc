print(os.read.lines(os.pwd/"i").map(_.toInt).toSeq.combinations(3).collectFirst{case Seq(a,b,c)if a+b+c==2020=>a*b*c})