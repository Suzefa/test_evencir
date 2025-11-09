class WeekDateModel {
  String dayInitial = "";
  String dateTime = "";

  WeekDateModel.empty();

  WeekDateModel.create({required this.dayInitial, required this.dateTime,});

  @override
  String toString() {
    return 'WeekDateModel{dayInitial: $dayInitial, dateTime: $dateTime}';
  }

}