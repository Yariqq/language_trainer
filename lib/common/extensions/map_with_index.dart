/// EN: [mapWithIndex] analogue of the [map] method providing information about the index of the current element
///
/// RU: [mapWithIndex] аналог метода [map] предоставляющий информацию о индексе текущего элемента
///
extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];

    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }
}
