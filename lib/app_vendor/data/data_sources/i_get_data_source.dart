import '../../app_vendor_export.dart';

abstract class IGetDataSource{
  Future<List<ResponseEntity>> get();
}