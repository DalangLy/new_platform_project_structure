import '../../../../../app_vendor/app_vendor_export.dart';
import '../../../language_export.dart';

class LanguageRemoteDataSource implements ILanguageRemoteDataSource{
  final IHttpClient _httpClient;

  LanguageRemoteDataSource(this._httpClient,);

  @override
  Future<ResponseEntity> create({required RequestEntity entity}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<ResponseEntity>> get() async{
    final DResponse<dynamic> response = await _httpClient.get(
      path: '/languages',
    );

    final List<dynamic> parsed = response.data['Data'];
    return parsed.map<LanguageModel>((e) => LanguageModel.fromJson(json: e)).toList();
  }
}