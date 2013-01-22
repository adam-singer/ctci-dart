part of main;

abstract class Card {
  bool _available = true;

  /*
   * number or face that's on card - a number 2 through 10,
   * or 11 for Jack, 12 for Queen, 13 for King, or 1 for Ace
   */
  int faceValue;
  Suit _suit;

  Card(this.faceValue, this._suit);

  int value();

  Suit suit() => _suit;

  /* returns whether or not the card is available to be given out to someone */
  bool isAvailable() => _available;

  markUnavailable() => _available = false;
  markAvailable() => _available = true;

  void print_card() {
    List<String> faceValues = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];
    StringBuffer sb = new StringBuffer();
    sb.add(faceValues[faceValue - 1]);
    switch(suit) {
      case Suit.Club:
        sb.add('c');
        break;
      case Suit.Heart:
        sb.add('h');
        break;
      case Suit.Diamond:
        sb.add('d');
        break;
      case Suit.Spade:
        sb.add('s');
        break;
    }

    print(sb.toString());
  }

}
