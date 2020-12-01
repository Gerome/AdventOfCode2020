object Day1 extends App {

  Inputs.DAY_1.combinations(2).foreach {
    case one :: two :: Nil if one + two == 2020 => println(one * two)
    case _                                      =>
  }

}
