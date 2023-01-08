import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:progect_management_app/auth/create_account/model/create_account_model.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(const CreateAccountInitial());

  set onFirstNameChanged(String value) => emit(
        CreateAccountChanged(
          createAccountModel:
              state.createAccountModel.copyWith(firstName: value),
        ),
      );

  set onLastNameChanged(String value) => emit(
        CreateAccountChanged(
          createAccountModel:
              state.createAccountModel.copyWith(lastName: value),
        ),
      );

  set onEmailChanged(String value) => emit(
        CreateAccountChanged(
          createAccountModel: state.createAccountModel.copyWith(email: value),
        ),
      );

  set onPasswordChanged(String value) => emit(
        CreateAccountChanged(
          createAccountModel:
              state.createAccountModel.copyWith(password: value),
        ),
      );
}
