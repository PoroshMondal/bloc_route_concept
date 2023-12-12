import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/counter_cubit.dart';
import 'presentation/screens/anonymous_home_screen.dart';

class AnonymousRouteApp extends StatelessWidget {
  const AnonymousRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BLoC Route Access",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: anonymousBlocProvider(),
    );
  }

  BlocProvider anonymousBlocProvider() {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const AnonymousHomeScreen(
        title: "Anonymous Home Screen",
      ),
    );
  }

}
