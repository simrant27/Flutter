String giveMeHi() {
  return "Hi";
}

double add(double a, double b) {
  return a + b;
}

void main() {
  print(giveMeHi());
  print("Sum of 5 and 6 is:" + add(5, 6).toString());
  print("Sum of 1 and 2 is: ${add(1, 2)}");

  print("Sum of 6 and 2 , with named argument is: ${add2(a: 5, b: 6)}");
  print("Sum of 6 and 2 , with named argument is: ${addOptional(b: 6)}");

  print("Sum of both is: ${addBoth(5, c: 6)}");
}

double add2({required double a, required double b}) {
  return a + b;
}

double addOptional({double? a: 0, required double b}) {
  return a! + b;
}

double addOptional2({double? a, required double b}) {
  return b + (a ?? 0);
}

double addBoth(double a, {double? c}) {
  return a + (c ?? 0);
}
