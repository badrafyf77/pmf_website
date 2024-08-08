import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/config/theme.dart';
import 'package:pmf_website/core/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const MyApp());
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Events Week',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      routerConfig: AppRouter.router,
    );
  }
}
