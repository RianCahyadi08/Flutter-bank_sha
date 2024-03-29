import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/user_service.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());
          final users = await UserService().getUsersByUsername(event.username);
          // print(users);
          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFail(e.toString()));
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(UserLoading());
          final users = await UserService().getRecentUsers();
          // print(users);
          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFail(e.toString()));
        }
      }
    });
  }
}
