extension Capitalize on String {
  String get capitalize =>
      '${this.substring(0, 1).toUpperCase()}${this.substring(1, this.length).toLowerCase()}';
}
