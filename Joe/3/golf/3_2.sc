import scala.io.Source

print(Set((1,1),(3,1),(5,1),(7,1),(1,2)).map(f(Source.fromFile("i").getLines().toSeq,_).toLong).product)
def f:(Seq[String],(Int,Int))=>Int={case(l,(r,d))=>l.grouped(d).foldLeft((0,0))({case((x,t),z)=>(x+r,t+(if(z(0).charAt(x%z(0).length)=='#')1 else 0))})._2}