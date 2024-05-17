
import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/core/constants/light_color_constant.dart';
import '../../core/widget_data_builder/side_menu_data.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: ListView.builder(
          itemCount: data.menu.length,
          itemBuilder: (context, index) => buildMenuEntry(data, index)),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = _selectedIndex == index;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        color: isSelected? lightSelectionColor: Colors.transparent
      ),
      child: InkWell(
        onTap: () => setState(() {
          _selectedIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected? Colors.black: Colors.grey,
              ),
            ),
            Text(
                data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                  color: isSelected? Colors.black: Colors.grey,
                fontWeight: FontWeight.normal
              ),
            )
          ],
        ),
      ),
    );
  }
}
