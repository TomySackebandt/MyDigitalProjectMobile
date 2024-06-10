
import 'dart:convert';
import 'package:http/http.dart';

import '../blocs/user_cubit.dart';
import '../models/user.dart';

class LoginRepository{

  final String baseUrl = "http://cityscape.tengutech.fr/api/login";

  Future<bool> verifLogin () async {
    final Response response = await get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> loginResponse = jsonDecode(response.body);
      // if (loginResponse.login == true){
      //
      // }
      // context.read<UserCubit>().saveUser(User(loginResponse.user.firstname, loginResponse.user.id, loginResponse.user.email));
      // final List<Canisite> canisites = [];
      // mapResponse['results'].forEach((value) {
      // canisites.add(Canisite.fromJson(value['geo_point_2d']));
      // });

      return true;
    }
    else {
      // throw Exception('L\'API ne répond pas correctement.');
      return false;
    }
  }
}