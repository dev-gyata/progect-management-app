part of 'create_account_cubit.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState({required this.createAccountModel});
  final CreateAccountModel createAccountModel;

  @override
  List<Object> get props => [createAccountModel];
}

class CreateAccountInitial extends CreateAccountState {
  const CreateAccountInitial({
    super.createAccountModel = const CreateAccountModel(
      firstName: '',
      lastName: '',
      email: '',
      password: '',
    ),
  });
}

class CreateAccountChanged extends CreateAccountState {
  const CreateAccountChanged({required super.createAccountModel});
}
