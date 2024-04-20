import 'package:flutter/material.dart';
import 'package:food/blindings/general_bindings.dart';
import 'package:food/routes/app_routes.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:food/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
