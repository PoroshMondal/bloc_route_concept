import 'package:bloc_route_concept/route_access/generated_route_access/business_logic/cubit/generated_counter_cubit.dart';
import 'package:bloc_route_concept/route_access/generated_route_access/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/generated_home_screen.dart';
import 'presentation/screens/generated_second_screen.dart';
import 'presentation/screens/generated_third_screen.dart';

class GeneratedRouteApp extends StatefulWidget {
  const GeneratedRouteApp({super.key});

  @override
  State<GeneratedRouteApp> createState() => _GeneratedRouteAppState();
}

class _GeneratedRouteAppState extends State<GeneratedRouteApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BLoC Route Access",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      onGenerateRoute: _appRouter.onGeneratedRoute,
    );
  }

  // For GeneratedRouteAccess
  // need to close the BloCProvider INSTANCE
  // as we pass the instance specifically to the screen
  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

}
