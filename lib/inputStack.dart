class InputStack<T> {
  List<T> _stack = List.empty(growable: true);

  void push(T item) => _stack.add(item);

  T pop() => _stack.removeLast();

  T peek() => _stack.last;

  void clear() => _stack = List.empty(growable: true);

  bool get isEmpty => _stack.isEmpty;

  int get length => _stack.length;

  @override
  String toString() {
    String result = "";
    for (T item in _stack) {
      result +=  "$item, ";
    }
    return result;
  }
}

