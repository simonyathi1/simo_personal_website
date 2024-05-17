
import 'package:flutter/material.dart';

import '../models/framework_models/home/menu_model.dart';


class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard'),
    MenuModel(icon: Icons.home, title: 'Profile'),
    MenuModel(icon: Icons.home, title: 'Exercise'),
  ];
}