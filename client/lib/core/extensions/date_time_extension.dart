extension DateCompare on DateTime {
  bool isSameDay(DateTime toCompare) =>
      day == toCompare.day &&
      month == toCompare.month &&
      year == toCompare.year;
}
