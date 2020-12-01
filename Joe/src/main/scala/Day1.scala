object Day1 extends App {

  Inputs.DAY_1.combinations(2).foreach {
    case one :: two :: Nil if one + two == 2020 => println(one * two)
    case _                                      =>
  }

  Inputs.DAY_1.combinations(3).foreach {
    case one :: two :: three :: Nil if one + two + three == 2020 => println(one * two * three)
    case _                                                       =>
  }

}
