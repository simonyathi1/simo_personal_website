import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/util/responsive.dart';

// ── Data ─────────────────────────────────────────────────────────────────────

class _CompGroup {
  final String title;
  final List<String> items;
  final IconData icon;
  const _CompGroup({
    required this.title,
    required this.items,
    required this.icon,
  });
}

// ── Widget ────────────────────────────────────────────────────────────────────

class CoreCompetenciesWidget extends StatelessWidget {
  const CoreCompetenciesWidget({super.key});

  static const List<_CompGroup> _groups = [
    _CompGroup(
      title: 'Payments & Fintech',
      icon: Icons.account_balance_wallet_outlined,
      items: [
        'Mobile payment platform development',
        'Transaction lifecycle design',
        'Secure token handling',
        'SDK integrations for payment environments',
        'High-reliability system thinking',
      ],
    ),
    _CompGroup(
      title: 'Architecture & Platform',
      icon: Icons.layers_outlined,
      items: [
        'Clean Architecture implementation',
        'SDK modularization',
        'Multi-module Android systems',
        'Cross-platform abstraction (Flutter ↔ Native)',
        'Dependency injection strategy (Hilt/Dagger)',
        'Asynchronous system coordination',
        'Scalable mobile system design',
      ],
    ),
    _CompGroup(
      title: 'Technical Depth',
      icon: Icons.build_outlined,
      items: [
        'Advanced Kotlin & Coroutines',
        'StateFlow-based state management',
        'Jetpack Compose',
        'Flutter (BLoC/Cubit)',
        'MVVM',
        'Room & persistence strategies',
        'Version catalog & dependency governance',
      ],
    ),
    _CompGroup(
      title: 'Leadership & Influence',
      icon: Icons.people_outline,
      items: [
        'Architectural decision participation',
        'Mentorship and technical guidance',
        'Cross-functional collaboration',
        'Enterprise stakeholder alignment',
        'Code quality & review leadership',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        Center(
          child: Text(
            'Core Competencies',
            style: AppTextStyles.sectionTitleBoldR(context),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        ResponsiveLayout(
          desktop: (_) => _buildDesktopRow(context),
          tablet: (_) => _buildWrap(context, columns: 2),
          mobile: (_) => _buildWrap(context, columns: 1),
        ),
      ],
    );
  }

  Widget _buildDesktopRow(BuildContext context) {
    const gap = AppSpacing.xl;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < _groups.length; i++) ...[
            if (i > 0) const SizedBox(width: gap),
            Expanded(child: _GroupCard(group: _groups[i], context: context)),
          ],
        ],
      ),
    );
  }

  Widget _buildWrap(BuildContext context, {required int columns}) {
    const gap = AppSpacing.lg;
    return LayoutBuilder(
      builder: (_, constraints) {
        final totalGap = gap * (columns - 1);
        final cardWidth = (constraints.maxWidth - totalGap) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final g in _groups)
              SizedBox(
                width: cardWidth,
                child: _GroupCard(group: g, context: context),
              ),
          ],
        );
      },
    );
  }
}

// ── Card ──────────────────────────────────────────────────────────────────────

class _GroupCard extends StatelessWidget {
  final _CompGroup group;
  // context passed so icon/title sizes can scale on mobile
  final BuildContext context;

  const _GroupCard({required this.group, required this.context});

  @override
  Widget build(BuildContext _) {
    final iconSize = Responsive.value<double>(
      context,
      mobile: 26.0,
      tablet: 30.0,
      desktop: 34.0,
    );
    final badgePadding = Responsive.value<double>(
      context,
      mobile: 14.0,
      tablet: 16.0,
      desktop: 18.0,
    );
    final cardPadding = Responsive.value<double>(
      context,
      mobile: 20.0,
      tablet: 24.0,
      desktop: 28.0,
    );

    return Container(
      padding: EdgeInsets.fromLTRB(cardPadding, cardPadding * 1.2, cardPadding, cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(45),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon badge
          Container(
            padding: EdgeInsets.all(badgePadding),
            decoration: BoxDecoration(
              color: AppColors.lightCardBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              group.icon,
              size: iconSize,
              color: AppColors.lightPrimary,
            ),
          ),
          SizedBox(height: Responsive.value<double>(
            context, mobile: 14.0, tablet: 16.0, desktop: 20.0,
          )),
          // Title
          Text(
            group.title,
            style: AppTextStyles.cardTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Responsive.value<double>(
            context, mobile: 14.0, tablet: 16.0, desktop: 20.0,
          )),
          // Items — left-aligned within the card
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final item in group.items) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('– ', style: AppTextStyles.label),
                      Expanded(
                        child: Text(item, style: AppTextStyles.label),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
