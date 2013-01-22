
class Term {
  static const True = 0;
  static const False = 1;
  static const And = 2;
  static const Or = 3;
  static const Xor = 4;
  static const LeftParen = 5;
  static const RightParen = 6;
  int value;
  Term(this.value);
}

String reduce(String expression, int start, int end) {

  if (start == end) {
    if (expression[start] == '1') {
      return "1";
    } else if (expression[start] == '0') {
      return "0";
    }
  }

  int count = 0;
  int i = 0;
  List<String> reduced = new List<String>(3);
  int index = 0;
  int left = start;
  int right = start;
  for (i = start; i <= end; i++) {
    if (expression[i] == '(') {
      if (count == 0) {
        left = i + 1;
      }
      count++;
    } else if (expression[i] == ')') {
      count--;
      if (count == 0) {
        right = i - 1;
      }
    }

    if (count == 0) {
      reduced[index] = reduce(expression, left, right);
      if (index == 0) {
        reduced[index + 1] = expression[i + 1];
        i += 1;
        left = i + 1;
        right = i + 1;
      }
      index += 2;
    }
  }

  if (reduced[1] == "&") {
    if (reduced[0] == "1" && reduced[2] == "1") {
      return "1";
    }

    return "0";
  } else if (reduced[1] == "|") {
    if (reduced[0] == "1" || reduced[2] == "1") {
      return "1";
    }

    return "0";
  } else if (reduced[1] == "^") {
    if (reduced[0] == "1" && reduced[2] == "0") {
      return "1";
    } else if (reduced[0] == "0" && reduced[2] == "1") {
      return "1";
    }

    return "0";
  }

  return "0";
}

bool evaluate(String expression, int start, int end) {
  String result = reduce(expression, start, end);
  if (result == "0") {
    return false;
  } else {
    return true;
  }
}

bool isOperator(String c) {
  switch(c) {
    case '&':
    case '|':
    case '^':
      return true;
    default:
      return false;
  }
}



void main() {
  throw "SOLTION NOT FINISHED";
}