object Day1 extends App {

  Inputs.DAY_1.combinations(2).collectFirst {
    case List(one, two) if one + two == 2020 => println(one * two)
  }

  Inputs.DAY_1.combinations(3).collectFirst {
    case List(one, two, three) if one + two + three == 2020 => println(one * two * three)
  }

}
