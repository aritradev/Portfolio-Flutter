import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// ANIMATION #2: Color transition.
/// A chip that smoothly animates background/text/border color
/// when selected, using AnimatedContainer + AnimatedDefaultTextStyle.
class AnimatedSkillChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AnimatedSkillChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final textColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent
              : (isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected
                ? AppColors.accent
                : borderColor.withValues(alpha: 0.9),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: selected
                  ? AppColors.accent.withValues(alpha: 0.18)
                  : Colors.black.withValues(alpha: isDark ? 0.12 : 0.04),
              blurRadius: selected ? 18 : 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 280),
          style: TextStyle(
            color: selected ? Colors.white : textColor,
            fontSize: 13,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
