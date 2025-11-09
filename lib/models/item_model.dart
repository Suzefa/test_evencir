import 'package:test_evencir/test_evencir.dart';

class ItemModel {
  String title = "";
  String subTitle = "";
  String dateTime = "";
  ItemTagEnum itemTag = ItemTagEnum.armsWorkout;

  ItemModel.empty();

  @override
  String toString() {
    return 'ItemModel{title: $title, subTitle: $subTitle, dateTime: $dateTime, itemTag: $itemTag}';
  }
}