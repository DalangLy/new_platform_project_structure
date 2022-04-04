import '../../../../core/core_export.dart';

abstract class ILoginRemoteDataSource{
  Future<TokenModel?> issueNewAccessToken({required TokenModel oldToken});
  Future<TokenModel> login({required Map<String, dynamic> json,});
}