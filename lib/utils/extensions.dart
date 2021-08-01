part of '../date_ranger.dart';

extension DateTimeRangeExtension on DateTimeRange {
  DateTimeRange copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    if ((start == null || identical(start, this.start)) &&
        (end == null || identical(end, this.end))) {
      return this;
    }
    return new DateTimeRange(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
