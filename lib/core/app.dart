import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';
import '../cubit/pokedex_cubit.dart';

import 'config.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexCubit(),
      child: MaterialApp(
        title: Config.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.initialRoute,
        routes: Routes.allRoutes,
      ),
    );
  }
}
