import 'package:city_scape/ui/screen/connexion.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConnexionPage()));
        },
        child: const Text('Enabled'),
      ),
    );
  }
}
