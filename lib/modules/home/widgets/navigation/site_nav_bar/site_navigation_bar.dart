import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';
import '../../../cubit/navigation_cubit.dart';
import '../../../cubit/navigation_state.dart';
import '../common/social_section_widget.dart';

class SiteNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final Map<PortfolioSection, GlobalKey> sectionKeys;

  const SiteNavigationBar({super.key, required this.sectionKeys});

  @override
  Size get preferredSize {
    // preferredSize can't use BuildContext, so we return the largest value
    // and let the Scaffold's appBar PreferredSize in home_page override it.
    return const Size.fromHeight(AppSpacing.navBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: (_) => _MobileNavBar(sectionKeys: sectionKeys),
      tablet: (_) => _DesktopNavBar(sectionKeys: sectionKeys, compact: true),
      desktop: (_) => _DesktopNavBar(sectionKeys: sectionKeys, compact: false),
    );
  }
}

// ── Desktop / Tablet bar (3-column row) ──────────────────────────────────────

class _DesktopNavBar extends StatelessWidget {
  final Map<PortfolioSection, GlobalKey> sectionKeys;
  final bool compact;

  const _DesktopNavBar({required this.sectionKeys, required this.compact});

  @override
  Widget build(BuildContext context) {
    final height   = AppSpacing.navBarH(context);
    final leftPad  = AppSpacing.navLogoLeftPad(context);
    final itemSize = AppSpacing.navItemSizeR(context);

    return Container(
      height: height,
      color: AppColors.lightBackground,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: leftPad),
              child: BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      _NavBarItem(
                        title: 'HOME',
                        section: PortfolioSection.home,
                        isActive: state.activeSection == PortfolioSection.home,
                        sectionKeys: sectionKeys,
                        itemSize: itemSize,
                      ),
                      _NavBarItem(
                        title: 'ABOUT',
                        section: PortfolioSection.about,
                        isActive: state.activeSection == PortfolioSection.about,
                        sectionKeys: sectionKeys,
                        itemSize: itemSize,
                      ),
                      _NavBarItem(
                        title: 'SKILLS',
                        section: PortfolioSection.skills,
                        isActive: state.activeSection == PortfolioSection.skills,
                        sectionKeys: sectionKeys,
                        itemSize: itemSize,
                      ),
                      _NavBarItem(
                        title: 'CERTS',
                        section: PortfolioSection.certifications,
                        isActive: state.activeSection == PortfolioSection.certifications,
                        sectionKeys: sectionKeys,
                        itemSize: itemSize,
                      ),
                      _NavBarItem(
                        title: 'PDP',
                        section: PortfolioSection.pdp,
                        isActive: state.activeSection == PortfolioSection.pdp,
                        sectionKeys: sectionKeys,
                        itemSize: itemSize,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSpacing.navBarLogoHeight,
                  child: Image.asset(
                    'images/logo/S-no-border-small.png',
                    color: AppColors.lightPrimary,
                  ),
                ),
                const Text(
                  PortfolioContent.brandName,
                  style: AppTextStyles.navBrand,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: SocialSectionWidget(originalColor: AppColors.lightPrimary),
          ),
        ],
      ),
    );
  }
}

// ── Mobile bar (hamburger + logo) ─────────────────────────────────────────────

class _MobileNavBar extends StatelessWidget {
  final Map<PortfolioSection, GlobalKey> sectionKeys;

  const _MobileNavBar({required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.navBarH(context),
      color: AppColors.lightBackground,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.menu, color: AppColors.lightPrimary),
              onPressed: () => Scaffold.of(ctx).openDrawer(),
            ),
          ),
          Text(
            PortfolioContent.brandName.replaceAll('\n', ' '),
            style: AppTextStyles.navBrand.copyWith(letterSpacing: 2),
          ),
          SocialSectionWidget(
            originalColor: AppColors.lightPrimary,
            compact: true,
          ),
        ],
      ),
    );
  }
}

// ── Nav item ──────────────────────────────────────────────────────────────────

class _NavBarItem extends StatefulWidget {
  final String title;
  final PortfolioSection section;
  final bool isActive;
  final Map<PortfolioSection, GlobalKey> sectionKeys;
  final double itemSize;

  const _NavBarItem({
    required this.title,
    required this.section,
    required this.isActive,
    required this.sectionKeys,
    required this.itemSize,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  Color get _textColor {
    if (widget.isActive || _isHovered) return AppColors.lightAccent;
    return AppColors.lightPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final key = widget.sectionKeys[widget.section];
        if (key != null) {
          context.read<NavigationCubit>().scrollToSection(widget.section, key);
        }
      },
      onHover: (isHovered) => setState(() => _isHovered = isHovered),
      hoverColor: AppColors.transparent,
      child: SizedBox(
        height: widget.itemSize,
        width: widget.itemSize,
        child: Center(
          child: Text(
            widget.title,
            style: AppTextStyles.navItem.copyWith(color: _textColor),
          ),
        ),
      ),
    );
  }
}
