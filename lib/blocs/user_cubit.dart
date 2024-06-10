import 'package:city_scape/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/preferences_repository.dart';

class UserCubit extends Cubit<User>{

  final PreferencesRepository preferencesRepository;

  UserCubit(this.preferencesRepository) : super(User("",0,""));

  Future<void> loadUser() async {
    User user = await preferencesRepository.loadUser();
    emit(user);
  }

  void saveUser(User user){
    preferencesRepository.saveUser(user);
    emit(user);
  }

  void deleteUser(){
    preferencesRepository.saveUser(User("", 0, ""));
    emit(User("", 0,""));
  }
}