double add(double c, double d) {
  return c + d;
}

void runAddition(double? Function(double a, double b) function) {
  print(function(5, 4));
}

void main() {
  runAddition((a, b) => null);

  runAddition(add);
}
