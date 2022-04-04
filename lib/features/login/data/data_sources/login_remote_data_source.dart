import 'package:dio/dio.dart';
import '../../../../core/core_export.dart';
import 'i_login_remote_data_source.dart';

class LoginRemoteDataSource implements ILoginRemoteDataSource{
  final Dio _dio;
  LoginRemoteDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<TokenModel?> issueNewAccessToken({required TokenModel oldToken}) async {
    try{
      final response = await _dio.post(
        'http://192.168.100.81:8088/the-raccoon-passport/public/api/issue_new_access_token',
        data: {
          'refresh_token': oldToken.refreshToken,
        },
        onSendProgress: (count, total) {
          //print('count is : $count total is : $total');
        },
        onReceiveProgress: (count, total) {
          //print('1count is : $count total is : $total');
        },
        options: Options(
            sendTimeout: 2000,
            receiveTimeout: 3000,
            method: 'POST'
        ),
      );
      if(response.statusCode == 200){
        if(response.data['token_type'] == null){
          return null;
        }
        return TokenModel.fromJson(response.data);
      }
      throw Exception();
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<TokenModel> login({required Map<String, dynamic> json,}) async {
    try{
      final response = await _dio.post(
        'https://96.9.67.188:4434 /identity/token',
        data: json,
      );
      if(response.statusCode == 200){
        return TokenModel.fromJson(response.data['data']);
      }
      throw Exception();
    }catch(e){
      throw Exception(e);
    }
  }
}