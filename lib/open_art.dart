import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/ui/feature/dashboard/presentation/bloc/dasshboard_bloc.dart';
import 'package:open_art/ui/feature/discover/presentation/bloc/discover_bloc.dart';
import 'package:open_art/ui/feature/onboarding/onboarding_screen.dart';
import 'package:open_art/utils/app_wrapper/app_wrapper.dart';

class OpenArt extends StatefulWidget {
  const OpenArt({super.key});

  @override
  State<OpenArt> createState() => _OpenArtState();
}

class _OpenArtState extends State<OpenArt> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<DiscoverBloc>(create: (context) => DiscoverBloc()),
            BlocProvider<DashboardBloc>(create: (context) => DashboardBloc()),
          ],
          child: AppMainWrapper(
              child: MaterialApp(
            title: 'Open Art',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: OnboardingScreen(),
          )),
        );
      },
    );
  }
}
