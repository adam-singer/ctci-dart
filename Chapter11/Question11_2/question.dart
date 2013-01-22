class AnagramComparator {
  static String sortChars(String s) {
    List<String> content = s.splitChars();
    content.sort();
    return Strings.concatAll(content);
  }

  static int compare(String s1, String s2) {
    return sortChars(s1).compareTo(sortChars(s2));
  }
}

void main() {
  List<String> array = ["apple", "banana", "carrot", "ele", "duck", "papel", "tarroc", "cudk", "eel", "lee"];
  print(array);
  array.sort(AnagramComparator.compare);
  print(array);
}