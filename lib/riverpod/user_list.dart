import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled2/models/user_riverpod.dart';


class UserListController extends StateNotifier<List<UserRiverpod>>{
  UserListController() : super(const []);


static final provider = StateNotifierProvider<UserListController, List<UserRiverpod>>((ref) {
    return UserListController();
  });
  
   addUser(UserRiverpod user){
    state = [...state, user];
  }

  deleteUser(UserRiverpod user){
    state = state.where((_user) => _user.name != user.name).toList();
  }

}