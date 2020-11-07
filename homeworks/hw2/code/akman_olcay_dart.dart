

void main() {

  var myList = [1,2,3,4,5];
  //int as loop control variable
  for (var i in myList) {
    print(i);
  }

  print("");

  //bool as loop control variable
  //also example for question4 of homework.
  var x = 3;
  bool i;
  for (i = true; i; x--) {
    print(x);
    if (x == 0) {
      i = false;
    }
  }


  print("");

  //int(annotated by var) as loop control variable
  var y;
  for (y = 3; y > 0; y--) {
    y = y - 1;
    print(y); //loop control variable recognized here
  }
  //loop control variable not recognized here

}