import 'package:bloc_route_concept/route_access/generated_route_access/business_logic/cubit/generated_counter_cubit.dart';
import 'package:bloc_route_concept/route_access/generated_route_access/presentation/screens/generated_home_screen.dart';
import 'package:bloc_route_concept/route_access/generated_route_access/presentation/screens/generated_second_screen.dart';
import 'package:bloc_route_concept/route_access/generated_route_access/presentation/screens/generated_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final GeneratedCounterCubit _counterCubit = GeneratedCounterCubit();

  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const GeneratedHomeScreen(
                title: "Generated Home Screen",
                color: Colors.blueAccent,
              ),
            )
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const GeneratedSecondScreen(
                title: "Generated Second Screen",
                color: Colors.blueAccent,
              ),
            )
        );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _counterCubit,
              child: const GeneratedThirdScreen(
                title: "Generated Third Screen",
                color: Colors.blueAccent,
              ),
            )
        );
      default:
        null;
    }
    return null;
  }

  void dispose(){
    _counterCubit.close();
  }

}

