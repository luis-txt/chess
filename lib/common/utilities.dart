//Holds useful utilities for the entire application

String getGrid(List<List<int>> figures) {
  String result = '';

  for (var i = 0; i < figures.length; i++) {
    result += figures[i].toString();
    result += '\n';
  }
  return result;
}
