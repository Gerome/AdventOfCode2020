print(Set((1,1),(3,1),(5,1),(7,1),(1,2)).map(f(scala.io.Source.fromFile("i").getLines().toSeq,_).toLong).product)
def f:(Seq[String],(Int,Int))=>Int={case(l,(r,d))=>var i=0;l.grouped(d).count{l=>val b=l(0).charAt(i%l(0).length)=='#';i=i+r;b}}