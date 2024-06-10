import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_cubit.dart';
import '../../models/user.dart';
import 'connexion.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("City Scape"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(children: [
            // Text(context.read<UserCubit>().state.firstname),
            Text("TestUser Firstname"),
            Text("TestUser Lastname"),
            Text("TestUser@email.com"),
            Text("TestUser phone"),
            // Text(context.read<UserCubit>().state.lastname),
            // Text(context.read<UserCubit>().state.email),
            // Text(context.read<UserCubit>().state.phone.toString()),
            ElevatedButton(
              onPressed: () {
                context.read<UserCubit>().deleteUser();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConnexionPage()));
              },
              child: const Text('Logout'),
            ),
          ])),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text("© CityScape 2024"),
          )
        ],
      ),
    );
  }
}
