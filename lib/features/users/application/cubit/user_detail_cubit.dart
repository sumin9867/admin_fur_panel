import 'package:admin_fur_care/features/users/application/cubit/user_detail_state.dart';
import 'package:admin_fur_care/features/users/infrastructure/admin_user_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  final AdminUserDataRepo adminUserDataRepo;
  UsersCubit({required this.adminUserDataRepo}) : super(UsersInitial());

  Future<void> getUsers() async {
    try {
      emit(UsersLoading());

      emit(UsersLoaded(users: await adminUserDataRepo.getUsers()));
    } catch (e) {
      emit(UsersError(message: 'Failed to fetch users: $e'));
    }
  }
}
