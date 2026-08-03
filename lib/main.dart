import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/portfolio_controller.dart';
import 'controllers/theme_controller.dart';
import 'theme/app_theme.dart';
import 'views/home_view.dart';

void main() {
  Get.put(ThemeController());
  Get.put(PortfolioController());
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aritra | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // system-adaptive by default
      home: const HomeView(),
    );
  }
}
