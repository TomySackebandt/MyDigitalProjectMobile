import 'package:city_scape/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_cubit.dart';
import '../../models/user.dart';
import 'home.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formKey = GlobalKey<FormState>();
  var loginRepo = LoginRepository();
  var email = "";

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Connexion"),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'example@example.fr',
                    labelText: 'Email *',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    email = value ?? "";
                    return (value != null && !value.contains('@')) ? 'Email invalide' : null;
                  },
                ),
              const Divider(),
               TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password *',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && !value.contains('@')) ? 'Email invalide' : null;
                  },
                ),
              FloatingActionButton.extended(
                heroTag: "loginBtn",
                onPressed: () async {
                  if(await loginRepo.verifLogin()){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                  }
                  context.read<UserCubit>().saveUser(User("TestUser   ", 1, email));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                  // print("test");
                },
                label: const Text('Login'),
                icon: const Icon(Icons.person),
              )
            ],
            )
          ),
        )
    );
  }
}
