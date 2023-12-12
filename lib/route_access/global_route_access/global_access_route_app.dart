import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/global_counter_cubit.dart';
import 'presentation/router/global_app_router.dart';

class GlobalAccessRouteApp extends StatelessWidget {
  GlobalAccessRouteApp({super.key});

  final GlobalAppRouter _appRouter = GlobalAppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalCounterCubit>(
      create: (context) => GlobalCounterCubit(),
      child: MaterialApp(
        title: "BLoC Route Access",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        onGenerateRoute: _appRouter.onGeneratedRoute,
      ),
    );
  }
}
