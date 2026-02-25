import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/navigation_cubit.dart';
import '../cubit/navigation_state.dart';
import '../widgets/about_me/about_me_widget.dart';
import '../widgets/certs/certifications_widget.dart';
import '../widgets/contact/contact_widget.dart';
import '../widgets/education_and_exp/education_and_exp_widget.dart';
import '../widgets/landing/landing_widget.dart';
import '../widgets/navigation/site_footer/footer_widget.dart';
import '../widgets/navigation/site_nav_bar/site_navigation_bar.dart';
import '../widgets/pdp_and_projects/pdp_and_projects_widget.dart';
import '../widgets/skills/skills_widget.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/content/portfolio_content.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/util/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NavigationCubit _cubit;
  late CustomMouseCursor assetCursorOnly25;

  final _sectionKeys = <PortfolioSection, GlobalKey>{
    PortfolioSection.home:           GlobalKey(),
    PortfolioSection.about:          GlobalKey(),
    PortfolioSection.skills:         GlobalKey(),
    PortfolioSection.experience:     GlobalKey(),
    PortfolioSection.certifications: GlobalKey(),
    PortfolioSection.pdp:            GlobalKey(),
    PortfolioSection.contact:        GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _cubit = NavigationCubit();
  }

  Future<void> initCursor() async {
    assetCursorOnly25 = await CustomMouseCursor.asset(
      'assets/images/logo/s-logo-no-bg-crop.png',
      hotX: 18,
      hotY: 0,
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppSpacing.navBarH(context)),
          child: SiteNavigationBar(sectionKeys: _sectionKeys),
        ),
        drawer: isMobile ? _NavDrawer(sectionKeys: _sectionKeys) : null,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.pageVerticalPadding,
              horizontal: AppSpacing.pageHPadding(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LandingWidget(key: _sectionKeys[PortfolioSection.home]),
                SizedBox(height: isMobile ? AppSpacing.xl : AppSpacing.heroBottomSpacing),
                AboutMeWidget(key: _sectionKeys[PortfolioSection.about]),
                const SizedBox(height: AppSpacing.sectionSpacing),
                SkillsWidget(key: _sectionKeys[PortfolioSection.skills]),
                const SizedBox(height: AppSpacing.sectionSpacing),
                EducationAndExperienceWidget(key: _sectionKeys[PortfolioSection.experience]),
                const SizedBox(height: AppSpacing.sectionSpacing),
                CertificationsWidget(key: _sectionKeys[PortfolioSection.certifications]),
                const SizedBox(height: AppSpacing.sectionSpacing),
                PDPAndProjectsWidget(key: _sectionKeys[PortfolioSection.pdp]),
                const SizedBox(height: AppSpacing.sectionSpacing),
                ContactDetailsWidget(key: _sectionKeys[PortfolioSection.contact]),
                const SizedBox(height: AppSpacing.sectionSpacing),
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Mobile navigation drawer ──────────────────────────────────────────────────

class _NavDrawer extends StatelessWidget {
  final Map<PortfolioSection, GlobalKey> sectionKeys;

  const _NavDrawer({required this.sectionKeys});

  static const _items = [
    (label: 'HOME',         section: PortfolioSection.home),
    (label: 'ABOUT',        section: PortfolioSection.about),
    (label: 'SKILLS',       section: PortfolioSection.skills),
    (label: 'EXPERIENCE',   section: PortfolioSection.experience),
    (label: 'CERTS',        section: PortfolioSection.certifications),
    (label: 'PDP',          section: PortfolioSection.pdp),
    (label: 'CONTACT',      section: PortfolioSection.contact),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightBackground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.lg,
              ),
              child: Text(
                PortfolioContent.brandName,
                style: AppTextStyles.navBrand,
              ),
            ),
            const Divider(),
            for (final item in _items)
              ListTile(
                title: Text(item.label, style: AppTextStyles.navItem),
                onTap: () {
                  Navigator.of(context).pop();
                  final key = sectionKeys[item.section];
                  if (key != null) {
                    context
                        .read<NavigationCubit>()
                        .scrollToSection(item.section, key);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
