var i=0;print(scala.io.Source.fromFile("i").getLines().count{l=>val b=l.charAt(i%l.length)=='#';i=i+3;b})