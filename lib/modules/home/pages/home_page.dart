import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/home/widgets/contact/contact_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/education_and_exp/education_and_exp_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/navigation/site_footer/footer_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/navigation/site_nav_bar/site_navigation_bar.dart';
import 'package:simo_personal_website/modules/home/widgets/pdp_and_projects/pdp_and_projects_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/skills/skills_widget.dart';
import '../../core/util/responsive.dart';
import '../widgets/about_me/about_me_widget.dart';
import '../widgets/landing/landing_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late CustomMouseCursor assetCursorOnly25;
  @override
  void initState() {
    initCursor();
    super.initState();
  }

  void initCursor() async{
    assetCursorOnly25 = await CustomMouseCursor.asset(
        'assets/images/logo/s-logo-no-bg-crop.png',
        hotX: 18,
        hotY: 0);
  }
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      cursor: SystemMouseCursors.precise,
      child: Scaffold(
        // drawer: !isDesktop
        //     ? const SizedBox(
        //         width: 250,
        //         child: SideMenuWidget(),
        //       )
        //     : null,
        // endDrawer: isMobile
        //     ?  SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.75,
        //         child: const Padding(
        //           padding: EdgeInsets.only(right: 18.0),
        //           child: SummaryWidget(),
        //         ),
        //       )
        //     : null,
        appBar: AppBar(
          toolbarHeight: 180,
          title: const SiteNavigationBar(),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // !Responsive.isDesktop(context) ?
                    //  Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       InkWell(
                    //         onTap: () => Scaffold.of(context).openDrawer(),
                    //         child: const Icon(
                    //           Icons.menu,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       if (Responsive.isMobile(context)) InkWell(
                    //         onTap: () => Scaffold.of(context).openEndDrawer(),
                    //         child: const Icon(
                    //           Icons.summarize,
                    //           color: Colors.grey,
                    //         ),
                    //       ) ,
                    //     ],
                    //   ),
                    // ): const SizedBox(),
                    LandingWidget(),
                    SizedBox(
                      height: 120,
                    ),
                    AboutMeWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    SkillsWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    EducationAndExperienceWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    PDPAndProjectsWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    ContactDetailsWidget(),
                    SizedBox(
                      height: 18,
                    ),
                    FooterWidget()
                    // if(Responsive.isTablet(context))
                    //   const SizedBox(
                    //     height: 18,
                    //   ),
                    //
                    // if(Responsive.isTablet(context))
                    //   const SummaryWidget()
                  ],
                ),
              ),
            )
        ),
        //bottomNavigationBar: const FooterWidget(),
      ),
    );
  }
  // Expanded(
  // flex: 15,
  // child: Container(color: Colors.white,child: const LandingWidget(),),
  // ),
}
