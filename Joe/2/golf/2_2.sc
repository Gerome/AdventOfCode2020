import scala.io.Source

print(Source.fromFile("i").getLines().count{l=>val x=l.split(Array('-',' ',':'));val(a,b,c,p)=(x(0).toInt,x(1).toInt,x(2).head,x(4));p.charAt(a-1)==c^p.charAt(b-1)==c})