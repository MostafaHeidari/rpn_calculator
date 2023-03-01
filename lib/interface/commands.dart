abstract class Command<t> {
  String getName();
  String getSymbol();
  t execute(t input);
}