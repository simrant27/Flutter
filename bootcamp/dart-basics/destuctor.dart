void main() {
  var list1 = [1, 2, 3];
  var list2 = [6, 7, 8];
  var a = 8;
  bool toKeep8 = true;
  print([...list2, ...list1, if (toKeep8) a]);
  print([...list1, for (int num in list2) num * 2]);
}
