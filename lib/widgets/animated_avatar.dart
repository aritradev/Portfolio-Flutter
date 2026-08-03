import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../theme/app_theme.dart';

/// ANIMATION #1: Size + color transition.
/// Tapping the avatar grows it slightly and shifts its ring color
/// from accent-soft to full accent, using AnimatedContainer.
class AnimatedAvatar extends StatelessWidget {
  static const String profileImageUrl =
      'https://avatars.githubusercontent.com/u/147065581?v=4';

  const AnimatedAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Obx(() {
      final active = controller.avatarActive.value;
      final size = active ? 128.0 : 112.0;
      final ringColor = active ? AppColors.accent : AppColors.accentSoft;

      return GestureDetector(
        onTap: controller.toggleAvatar,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ringColor, width: 3),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: ringColor.withValues(alpha: 0.25),
                blurRadius: active ? 24 : 8,
                spreadRadius: active ? 2 : 0,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: ClipOval(
            child: Image.network(
              profileImageUrl,
              width: size - 10,
              height: size - 10,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(ringColor),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 350),
                    style: TextStyle(
                      fontSize: active ? 42 : 36,
                      fontWeight: FontWeight.bold,
                      color: ringColor,
                    ),
                    child: const Text('A'),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
