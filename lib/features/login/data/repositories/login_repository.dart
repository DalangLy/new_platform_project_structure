import '../../../../app_vendor/app_vendor_export.dart';
import '../../../../core/core_export.dart';
import '../../login_export.dart';

class LoginRepository implements ILoginRepository{
  final TokenDataSource _tokenDataSource;
  final ILoginRemoteDataSource _loginRemoteDataSource;

  LoginRepository({required TokenDataSource tokenDataSource, required ILoginRemoteDataSource loginRemoteDataSource,}) : _tokenDataSource = tokenDataSource, _loginRemoteDataSource = loginRemoteDataSource;

  @override
  Future<bool> login({required Map<String, dynamic> json,}) async {
    try{
      final TokenModel token = await _loginRemoteDataSource.login(json: json,);
      await _tokenDataSource.storeToken(newToken: token);
      return true;
    }catch(e){
      throw ServerFailure(message: 'Login Failed');
    }
  }
}