import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/named_counter_cubit.dart';
import 'presentation/screens/named_home_screen.dart';
import 'presentation/screens/named_second_screen.dart';
import 'presentation/screens/named_third_screen.dart';

class NamedRouteApp extends StatefulWidget {
  NamedRouteApp({super.key});

  @override
  State<NamedRouteApp> createState() => _NamedRouteAppState();
}

class _NamedRouteAppState extends State<NamedRouteApp> {
  // this is for NamedRoute Access
  // NamedCounterCubit
  // For NamedRouteAccess we need dispose the BlocProvider INSTANCE manually
  // For this we need dispose method
  final NamedCounterCubit _counterCubit = NamedCounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BLoC Route Access",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      routes: {
        '/': (context) => BlocProvider.value(
          value: _counterCubit,
          child: const NamedHomeScreen(
            title: "Named Home Screen",
            color: Colors.blueAccent,
          ),
        ),
        '/second': (context) => BlocProvider.value(
          value: _counterCubit,
          child: const NamedSecondScreen(
            title: "Named Second Screen",
            color: Colors.redAccent,
          ),
        ),
        '/third': (context) => BlocProvider.value(
          value: _counterCubit,
          child: const NamedThirdScreen(
            title: "Named Third Screen",
            color: Colors.greenAccent,
          ),
        ),
      },
    );
  }

  // For NamedRoute
  // need to close the BloCProvider INSTANCE
  // as we pass the instance specifically to the screen
  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

}
