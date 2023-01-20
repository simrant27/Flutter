void main() {
  int a = 5;

  int? b = 6;

  b = null; // type of b is nullable

  int? c;

  // c = a;

  // a = c!; //error in runtime

  a = c ?? 50;
  print(a);
  print(c ?? 14);
}
