import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';

/// ANIMATION #3: Size + color transition.
/// On tap (or hover on desktop/web), the card grows slightly, its border
/// switches to the accent color, and a soft accent-tinted shadow appears.
class AnimatedProjectCard extends StatefulWidget {
  final Project project;
  final bool active;
  final VoidCallback onTap;

  const AnimatedProjectCard({
    super.key,
    required this.project,
    required this.active,
    required this.onTap,
  });

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard> {
  bool hovering = false;

  bool get _emphasized => widget.active || hovering;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceColor =
        isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt;
    final secondaryText =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final primaryText =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_emphasized ? 1.025 : 1.0),
          transformAlignment: Alignment.center,
          padding: const EdgeInsets.all(22),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                surfaceColor,
                isDark
                    ? AppColors.darkBg.withValues(alpha: 0.40)
                    : AppColors.lightBg.withValues(alpha: 0.85),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _emphasized
                  ? AppColors.accent.withValues(alpha: 0.95)
                  : borderColor.withValues(alpha: 0.9),
              width: _emphasized ? 1.25 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent
                    .withValues(alpha: _emphasized ? 0.16 : 0.04),
                blurRadius: _emphasized ? 28 : 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: _emphasized ? AppColors.accent : primaryText,
                        letterSpacing: -0.2,
                      ),
                      child: Text(widget.project.title),
                    ),
                  ),
                  if (widget.project.liveUrl != null)
                    IconButton(
                      icon: const Icon(Icons.north_east, size: 18),
                      color: secondaryText,
                      tooltip: 'Open link',
                      onPressed: () =>
                          launchUrl(Uri.parse(widget.project.liveUrl!)),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.description,
                style: TextStyle(
                    fontSize: 13.5, color: secondaryText, height: 1.55),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.tags
                    .map((tag) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: AppColors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
