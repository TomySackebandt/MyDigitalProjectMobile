import 'package:city_scape/blocs/user_cubit.dart';
import 'package:city_scape/repositories/preferences_repository.dart';
import 'package:city_scape/ui/screen/connexion.dart';
import 'package:city_scape/ui/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Instanciation du Cubit
  final UserCubit userCubit = UserCubit(PreferencesRepository());
  // Chargement de l'utilisateur
  userCubit.loadUser();

  runApp(
      BlocProvider<UserCubit>(
        create: (_) => userCubit,
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: PreferencesRepository().loadUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(), // Affiche un loading
              ),
            );
          } else {
            return snapshot.data?.name != "" ? const MyHomePage() : const ConnexionPage();
          }
        },
      ),
    );
  }
}

