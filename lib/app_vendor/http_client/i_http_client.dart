abstract class IHttpClient{
  Future<DResponse> get({required String path, DOptions? options,});
}

class DOptions{
  final Map<String, dynamic>? headers;

  DOptions({this.headers});
}

class DResponse<T>{
  final int? statusCode;
  final T data;
  final String? statusMessage;

  DResponse(this.statusCode, this.data, this.statusMessage,);
}