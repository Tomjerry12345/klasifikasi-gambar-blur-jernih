import 'package:intl/intl.dart';

DateTime getTimeNow() => DateTime.now();

Map formatDate(DateTime date) {
  String month = DateFormat.MMMM().format(date);
  String day = DateFormat.d().format(date);
  String year = DateFormat.y().format(date);

  return {"day": day, "month": month, "year": year};
}
