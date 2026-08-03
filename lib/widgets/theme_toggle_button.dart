import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../theme/app_theme.dart';

/// Small animated icon toggle for switching between light/dark manually,
/// even though the app defaults to system-adaptive.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return Obx(() {
      final dark = controller.isDark(context);
      return GestureDetector(
        onTap: controller.toggleTheme,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: dark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, anim) =>
                RotationTransition(turns: anim, child: child),
            child: Icon(
              dark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              key: ValueKey(dark),
              size: 18,
              color: dark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ),
      );
    });
  }
}
