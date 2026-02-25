import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../cubit/navigation_cubit.dart';
import '../../../cubit/navigation_state.dart';
import '../common/social_section_widget.dart';

class SiteNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final Map<PortfolioSection, GlobalKey> sectionKeys;

  const SiteNavigationBar({super.key, required this.sectionKeys});

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.navBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.navBarHeight,
      color: AppColors.lightBackground,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: AppSpacing.navLogoLeftPadding),
              child: BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      _NavBarItem(
                        title: 'HOME',
                        section: PortfolioSection.home,
                        isActive: state.activeSection == PortfolioSection.home,
                        sectionKeys: sectionKeys,
                      ),
                      _NavBarItem(
                        title: 'ABOUT',
                        section: PortfolioSection.about,
                        isActive: state.activeSection == PortfolioSection.about,
                        sectionKeys: sectionKeys,
                      ),
                      _NavBarItem(
                        title: 'SKILLS',
                        section: PortfolioSection.skills,
                        isActive: state.activeSection == PortfolioSection.skills,
                        sectionKeys: sectionKeys,
                      ),
                      _NavBarItem(
                        title: 'CERTS',
                        section: PortfolioSection.certifications,
                        isActive: state.activeSection == PortfolioSection.certifications,
                        sectionKeys: sectionKeys,
                      ),
                      _NavBarItem(
                        title: 'PDP',
                        section: PortfolioSection.pdp,
                        isActive: state.activeSection == PortfolioSection.pdp,
                        sectionKeys: sectionKeys,
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
          const Expanded(
            flex: 5,
            child: SocialSectionWidget(originalColor: AppColors.lightPrimary),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final PortfolioSection section;
  final bool isActive;
  final Map<PortfolioSection, GlobalKey> sectionKeys;

  const _NavBarItem({
    required this.title,
    required this.section,
    required this.isActive,
    required this.sectionKeys,
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
        height: AppSpacing.navItemSize,
        width: AppSpacing.navItemSize,
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
