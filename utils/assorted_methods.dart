library assorted_methods;
import 'dart:math';
import 'linked_list_node.dart';
import 'drandom.dart';

String arrayToString(List<int> array) {
  StringBuffer sb = new StringBuffer();
  for (int v in array) {
    sb.add("$v, ");
  }
  return sb.toString();
}

List<List<int>> randomMatrix(int M, int N, int min, int max) {
  Random random = new Random();
  List<List<int>> matrix = new List<List<int>>(M);
  for (int i = 0; i < M; i++) {
    matrix[i] = new List<int>(N);
    for (int j = 0; j < N; j++) {
      int x = random.nextInt(max);

      // XXX: This is a bad hack cause Random still doesnt support
      // some basic methods.
      while (x < min) x = random.nextInt(max);

      matrix[i][j] = x;
    }
  }

  return matrix;
}

void printIntMatrix(List<List<int>> matrix) {
  StringBuffer sb = new StringBuffer();
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] < 10 && matrix[i][j] > -10) {
        sb.add(' ');
      }
      if (matrix[i][j] < 100 && matrix[i][j] > -100) {
        sb.add(' ');
      }
      if (matrix[i][j] >= 0) {
        sb.add(' ');
      }
      sb.add(' ${matrix[i][j]}');
    }
    sb.add("\n");
  }

  print(sb.toString());
}

LinkedListNode randomLinkedList(int N, int min, int max) {
  DRandom random = new DRandom.withSeed(10);
  int r = random.NextFromRange(min, max);
  LinkedListNode root = new LinkedListNode(r, null, null);

  LinkedListNode prev = root;
  for (int i = 1; i < N; i++) {
    int data = random.NextFromRange(min, max);
    LinkedListNode next = new LinkedListNode(data, null, null);
    prev.setNext(next);
    prev = next;
  }

  return root;
}

DRandom _random = new DRandom.withSeed(10);
int randomIntInRange(int min, int max) {
  return _random.NextFromRange(min, max);
}