import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class PlanController extends GetxController {
  final DateFormatter dateFormatter = DateFormatter();
  final List<PlaneItemModel> selectedWeekDays = [];
  RxBool isWeekDaysListUpdated = false.obs,isDragUpdate=false.obs;
  ItemModel? draggedItem;

  void getWeekDaysData() {
    final dateTime = DateTime.now();
    int currentWeekNumber = dateFormatter.getWeekNumber(dateTime);
    final weekData = dateFormatter.getWeekDatesList(currentWeekNumber, dateTime.year);
    selectedWeekDays.clear();
    selectedWeekDays.addAll(weekData.map<PlaneItemModel>((element) {
      return PlaneItemModel.create(dateTime: element.dateTime);
    }).toList());
    selectedWeekDays[2].itemModel = ItemModel.empty()
      ..title = "Leg Day Blitz"
      ..dateTime = selectedWeekDays[2].dateTime
      ..itemTag = ItemTagEnum.legWorkout
      ..subTitle = "25m - 30m";
    selectedWeekDays[5].itemModel = ItemModel.empty()
      ..title = "Arm Blaster"
      ..dateTime = selectedWeekDays[5].dateTime
      ..itemTag = ItemTagEnum.armsWorkout
      ..subTitle = "25m - 30m";
    isWeekDaysListUpdated.toggle();
  }

  @override
  void dispose() {
    Get.delete<PlanController>();
    super.dispose();
  }
}
