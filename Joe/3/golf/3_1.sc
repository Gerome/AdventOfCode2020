import scala.io.Source

print(Source.fromFile("i").getLines()./:((0,0))({case((i,t),l)=>(i+3,t+(if(l.charAt(i%l.length)=='#')1 else 0))})._2)