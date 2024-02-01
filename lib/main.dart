import 'package:aureus_jobbox/provider/applied_job_listing_provider.dart';
import 'package:aureus_jobbox/provider/bottom_nav_bar_provider.dart';
import 'package:aureus_jobbox/provider/file_upload.provider.dart';
import 'package:aureus_jobbox/provider/image_change_provider.dart';
import 'package:aureus_jobbox/provider/include_resume_for_education_provider.dart';
import 'package:aureus_jobbox/provider/selected_file_provider.dart';
import 'package:aureus_jobbox/provider/selected_job_listing_provider.dart';
import 'package:aureus_jobbox/provider/tab_bar_provider.dart';
import 'package:aureus_jobbox/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aureus_jobbox/view/login/route_login.dart';
import 'provider/include_resume_for_work_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ImageChangeProvider()),
      ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
      ChangeNotifierProvider(create: (_) => TabBarProvider()),
      ChangeNotifierProvider(create: (_) => SelectedJobListingProvider()),
      ChangeNotifierProvider(create: (_) => FileUploadProvider()),
      ChangeNotifierProvider(create: (_) => SelectedFileProvider()),
      ChangeNotifierProvider(create: (_) => AppliedJobListingProvider()),
      ChangeNotifierProvider(
          create: (_) => IncludeResumeForEducationProvider()),
      ChangeNotifierProvider(create: (_) => IncludeResumeForWorkProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
