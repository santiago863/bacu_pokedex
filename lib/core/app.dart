import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui/widgets/tokens/app_colors.dart';
import 'cubit/pokedex_cubit.dart';
import 'routes.dart';

import 'config.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexCubit()..fetchPokedex(),
      child: MaterialApp(
        title: Config.appName,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        initialRoute: Routes.initialRoute,
        routes: Routes.allRoutes,
      ),
    );
  }
}
