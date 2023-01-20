void main() {
  List<int> inputNumbers = [1, 2, 3, 4, 5];

  print(inputNumbers.map((v) => v * v).toList());

  print(inputNumbers.map((v) => v.toString() + v.toString()).toList());
}
