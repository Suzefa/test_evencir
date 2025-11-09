import 'package:test_evencir/test_evencir.dart';

class PlaneItemModel {
  String dateTime = "";
  ItemModel? itemModel;

  PlaneItemModel.empty();

  PlaneItemModel.create({this.itemModel, this.dateTime = ""});

  @override
  String toString() {
    return 'PlaneItemModel{dateTime: $dateTime, itemModel: $itemModel}';
  }
}
