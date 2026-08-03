import 'package:get/get.dart';

/// Holds interaction state that drives the animated UI:
/// - which skill chip is selected (color transition)
/// - which project card is active/expanded (size + color transition)
/// - avatar tap state (size + color transition)
class PortfolioController extends GetxController {
  final RxnString selectedSkillCategory = RxnString();
  final RxnInt activeProjectIndex = RxnInt();
  final RxBool avatarActive = false.obs;

  void selectSkillCategory(String category) {
    if (selectedSkillCategory.value == category) {
      selectedSkillCategory.value = null; // toggle off
    } else {
      selectedSkillCategory.value = category;
    }
  }

  void setActiveProject(int? index) {
    activeProjectIndex.value = index;
  }

  void toggleAvatar() {
    avatarActive.value = !avatarActive.value;
  }
}
