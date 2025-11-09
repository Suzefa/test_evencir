import 'package:get/get.dart';
import 'package:test_evencir/test_evencir.dart';

class MoodController extends GetxController {
  final List<String> moods = [
    AssetsIconAddress.kContentMoodIcon,
    AssetsIconAddress.kPeacefulMoodIcon,
    AssetsIconAddress.kHappyMoodIcon,
    AssetsIconAddress.kCalmMoodIcon,
  ];
  final List<String> moodLabels = ['Content', 'Peaceful', 'Happy', 'Calm'];
  RxDouble thumbAngle = 0.0.obs;
  RxInt currentIndex = 0.obs, nextIndex = 0.obs;


  @override
  void dispose() {
    Get.delete<MoodController>();
    super.dispose();
  }
}
