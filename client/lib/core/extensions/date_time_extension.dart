extension DateCompare on DateTime {
  bool isSameDay(DateTime toCompare) =>
      this.day == toCompare.day &&
      this.month == toCompare.month &&
      this.year == toCompare.year;
}
