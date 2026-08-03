import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/portfolio_controller.dart';
import '../models/project.dart';
import '../models/skill.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_avatar.dart';
import '../widgets/animated_project_card.dart';
import '../widgets/animated_skill_chip.dart';
import '../widgets/theme_toggle_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _maxContentWidth = 1080.0;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceColor =
        isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final primaryText =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryText =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final pageGlow = isDark
        ? AppColors.accent.withValues(alpha: 0.16)
        : AppColors.accent.withValues(alpha: 0.10);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -120,
            left: -100,
            child: _BackgroundGlow(
              color: pageGlow,
            ),
          ),
          Positioned(
            bottom: -140,
            right: -120,
            child: _BackgroundGlow(
              color: AppColors.accentSoft.withValues(alpha: 0.14),
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxContentWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TopBar(primaryText: primaryText),
                      const SizedBox(height: 24),
                      _HeroSection(
                        isDark: isDark,
                        borderColor: borderColor,
                        surfaceColor: surfaceColor,
                        primaryText: primaryText,
                        secondaryText: secondaryText,
                      ),
                      const SizedBox(height: 24),
                      _StatsRow(isDark: isDark),
                      const SizedBox(height: 24),
                      _SectionCard(
                        title: 'Skills',
                        subtitle:
                            'Languages, frameworks, and tools I use to ship work quickly and cleanly.',
                        child: _SkillsSection(controller: controller),
                      ),
                      const SizedBox(height: 20),
                      _SectionCard(
                        title: 'Projects',
                        subtitle:
                            'Selected work that shows product judgment, execution quality, and technical range.',
                        child: _ProjectsSection(controller: controller),
                      ),
                      const SizedBox(height: 20),
                      _SectionCard(
                        title: 'Competitive Programming',
                        subtitle:
                            'The part of my background that shows consistency, problem solving, and speed under pressure.',
                        child: const _CompetitiveProgrammingSection(),
                      ),
                      const SizedBox(height: 20),
                      _SectionCard(
                        title: 'Contact',
                        subtitle:
                            'Open to internships, collaborations, and roles where polished delivery matters.',
                        child: const _ContactSection(),
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: Text(
                          '© 2026 Aritra Dev. Built with Flutter.',
                          style: TextStyle(fontSize: 11, color: secondaryText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundGlow extends StatelessWidget {
  final Color color;

  const _BackgroundGlow({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0.0)],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final Color primaryText;

  const _TopBar({required this.primaryText});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryText =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aritra',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: primaryText,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Portfolio 2026',
                style: TextStyle(fontSize: 12, color: secondaryText),
              ),
            ],
          ),
        ),
        const ThemeToggleButton(),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  final bool isDark;
  final Color borderColor;
  final Color surfaceColor;
  final Color primaryText;
  final Color secondaryText;

  const _HeroSection({
    required this.isDark,
    required this.borderColor,
    required this.surfaceColor,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 860;

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: borderColor.withValues(alpha: isDark ? 0.9 : 0.75),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                surfaceColor.withValues(alpha: isDark ? 0.92 : 0.98),
                AppColors.accentWarm.withValues(alpha: isDark ? 0.05 : 0.03),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.30 : 0.08),
                blurRadius: 40,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: _HeroCopy(
                  primaryText: primaryText,
                  secondaryText: secondaryText,
                ),
              ),
              SizedBox(width: isWide ? 28 : 0, height: isWide ? 0 : 28),
              Expanded(
                flex: 2,
                child:
                    _HeroVisual(isDark: isDark, secondaryText: secondaryText),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroCopy extends StatelessWidget {
  final Color primaryText;
  final Color secondaryText;

  const _HeroCopy({required this.primaryText, required this.secondaryText});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleSize = width < 600 ? 32.0 : 44.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroBadge(
            text: 'Flutter Developer · CSE Undergraduate · Researcher'),
        const SizedBox(height: 16),
        Text(
          'I build polished web and mobile experiences with a strong first impression.',
          style: TextStyle(
            fontSize: titleSize,
            height: 1.08,
            fontWeight: FontWeight.w800,
            color: primaryText,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I work across Flutter, React/Next.js, C#, .NET, and machine-learning tooling. My focus is clean execution, thoughtful UI, and shipping products that feel credible to both users and recruiters.',
          style: TextStyle(
            fontSize: 15.5,
            height: 1.65,
            color: secondaryText,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _ActionButton(
              label: 'Email me',
              icon: Icons.email_outlined,
              filled: true,
              onTap: () => _openUrl('mailto:aritradev3333@gmail.com'),
            ),
            _ActionButton(
              label: 'GitHub',
              icon: Icons.code,
              filled: false,
              onTap: () => _openUrl('https://github.com/aritradev'),
            ),
            _ActionButton(
              label: 'LinkedIn',
              icon: Icons.business_center_outlined,
              filled: false,
              onTap: () => _openUrl('https://www.linkedin.com/in/aritradev/'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _HighlightChip(label: '.NET'),
            _HighlightChip(label: 'Machine learning'),
            _HighlightChip(label: 'System design'),
            _HighlightChip(label: 'IIUC'),
          ],
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  final bool isDark;
  final Color secondaryText;

  const _HeroVisual({required this.isDark, required this.secondaryText});

  @override
  Widget build(BuildContext context) {
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceColor =
        isDark ? AppColors.darkSurface : AppColors.lightSurface;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: surfaceColor,
            border: Border.all(color: borderColor.withValues(alpha: 0.85)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.16 : 0.04),
                blurRadius: 26,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AnimatedAvatar(),
              const SizedBox(height: 18),
              Text(
                'Available for internships and collaborative product work',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.accent.withValues(alpha: isDark ? 0.14 : 0.10),
                AppColors.accentWarm.withValues(alpha: isDark ? 0.08 : 0.05),
              ],
            ),
            border: Border.all(
              color: AppColors.accent.withValues(alpha: isDark ? 0.28 : 0.18),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Current focus',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Deepening my work in .NET, machine learning, and system design while building products with strong UI, scalable architecture, and practical engineering judgment.',
                style: TextStyle(
                    fontSize: 13.5, height: 1.55, color: secondaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroBadge extends StatelessWidget {
  final String text;

  const _HeroBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.18)),
        color: AppColors.accent.withValues(alpha: 0.05),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.accent,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: filled ? AppColors.accent : Colors.transparent,
          border: Border.all(
            color: filled
                ? AppColors.accent
                : AppColors.accent.withValues(alpha: 0.24),
          ),
          boxShadow: filled
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: filled ? Colors.white : AppColors.accent,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: filled ? Colors.white : AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final String label;

  const _HighlightChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.16 : 0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
          color:
              isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final bool isDark;

  const _StatsRow({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final items = <_StatItem>[
      _StatItem(
        value: '${projectList.length}',
        label: 'Highlighted projects',
        icon: Icons.work_outline,
      ),
      _StatItem(
        value: '${skillList.length}',
        label: 'Core skills listed',
        icon: Icons.auto_awesome_outlined,
      ),
      _StatItem(
        value: '1200+',
        label: 'Problems solved',
        icon: Icons.emoji_events_outlined,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 720;

        if (stacked) {
          return Column(
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _StatCard(item: item, isDark: isDark),
                  ),
                )
                .toList(),
          );
        }

        return Row(
          children: [
            Expanded(child: _StatCard(item: items[0], isDark: isDark)),
            const SizedBox(width: 12),
            Expanded(child: _StatCard(item: items[1], isDark: isDark)),
            const SizedBox(width: 12),
            Expanded(child: _StatCard(item: items[2], isDark: isDark)),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final _StatItem item;
  final bool isDark;

  const _StatCard({required this.item, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.14 : 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accent.withValues(alpha: isDark ? 0.16 : 0.10),
            ),
            child: Icon(item.icon, color: AppColors.accent, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem {
  final String value;
  final String label;
  final IconData icon;

  _StatItem({
    required this.value,
    required this.label,
    required this.icon,
  });
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceColor =
        isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final primaryText =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryText =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            surfaceColor,
            isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt,
          ],
        ),
        border: Border.all(color: borderColor.withValues(alpha: 0.85)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.16 : 0.05),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: primaryText,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.5,
                        color: secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final PortfolioController controller;

  const _SkillsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final categories = skillList.map((s) => s.category).toSet().toList();

    return Obx(() {
      final selected = controller.selectedSkillCategory.value;
      final visibleSkills = selected == null
          ? skillList
          : skillList.where((s) => s.category == selected).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: categories
                .map(
                  (category) => AnimatedSkillChip(
                    label: category,
                    selected: selected == category,
                    onTap: () => controller.selectSkillCategory(category),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: visibleSkills
                .map(
                  (skill) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Theme.of(context).dividerColor),
                    ),
                    child: Text(
                      skill.name,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}

class _ProjectsSection extends StatelessWidget {
  final PortfolioController controller;

  const _ProjectsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final active = controller.activeProjectIndex.value;
      final visibleProjects = projectList.take(3).toList();

      return Column(
        children: List.generate(visibleProjects.length, (index) {
          return AnimatedProjectCard(
            project: visibleProjects[index],
            active: active == index,
            onTap: () => controller.setActiveProject(
              active == index ? null : index,
            ),
          );
        }),
      );
    });
  }
}

class _CompetitiveProgrammingSection extends StatelessWidget {
  const _CompetitiveProgrammingSection();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryText =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final items = <_CpStatItem>[
      _CpStatItem(value: '1200+', label: 'Problems solved'),
      _CpStatItem(value: '50+', label: 'Online contests'),
      _CpStatItem(value: '1306', label: 'Codeforces Pupil'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: items
              .map(
                (item) => Container(
                  width: 170,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: isDark
                        ? AppColors.darkBg.withValues(alpha: 0.28)
                        : AppColors.lightSurface,
                    border: Border.all(
                      color:
                          isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.value,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.accent,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        Text(
          'I keep building through problem solving, contest practice, and ranked performance across Codeforces, CodeChef, and LeetCode.',
          style: TextStyle(
            fontSize: 13.5,
            height: 1.55,
            color: secondaryText,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _HighlightChip(label: 'CodeChef 1471'),
            _HighlightChip(label: 'LeetCode 1601'),
            _HighlightChip(label: 'ICPC training mindset'),
            _HighlightChip(label: 'Algorithmic problem solving'),
          ],
        ),
      ],
    );
  }
}

class _CpStatItem {
  final String value;
  final String label;

  const _CpStatItem({required this.value, required this.label});
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryText =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryText =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final links = <_ContactLink>[
      _ContactLink(
        label: 'Email',
        display: 'aritradev3333@gmail.com',
        url: 'mailto:aritradev3333@gmail.com',
        icon: Icons.email_outlined,
      ),
      _ContactLink(
        label: 'GitHub',
        display: 'github.com/aritradev',
        url: 'https://github.com/aritradev',
        icon: Icons.code,
      ),
      _ContactLink(
        label: 'LinkedIn',
        display: 'linkedin.com/in/aritradev',
        url: 'https://www.linkedin.com/in/aritradev/',
        icon: Icons.business_center_outlined,
      ),
      _ContactLink(
        label: 'Codeforces',
        display: 'codeforces.com/profile/Ari.',
        url: 'https://codeforces.com/profile/Ari.',
        icon: Icons.emoji_events_outlined,
      ),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: links
          .map(
            (link) => SizedBox(
              width: 240,
              child: InkWell(
                onTap: () => _openUrl(link.url),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:
                          isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                    color: isDark
                        ? AppColors.darkBg.withValues(alpha: 0.35)
                        : AppColors.lightSurface,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accent.withValues(
                            alpha: isDark ? 0.18 : 0.10,
                          ),
                        ),
                        child:
                            Icon(link.icon, size: 20, color: AppColors.accent),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              link.label,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: primaryText,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              link.display,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.5,
                                color: secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.north_east, size: 16, color: secondaryText),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ContactLink {
  final String label;
  final String display;
  final String url;
  final IconData icon;

  const _ContactLink({
    required this.label,
    required this.display,
    required this.url,
    required this.icon,
  });
}

Future<void> _openUrl(String url) async {
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}
