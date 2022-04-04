import '../../login_export.dart';

class LoginUseCase{
  final ILoginRepository _repository;
  LoginUseCase({required ILoginRepository repository,}) : _repository = repository;

  Future<bool> call({required Map<String, dynamic> json,}){
    return _repository.login(json: json);
  }
}