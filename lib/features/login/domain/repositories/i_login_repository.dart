abstract class ILoginRepository{
  Future<bool> login({required Map<String, dynamic> json,});
}