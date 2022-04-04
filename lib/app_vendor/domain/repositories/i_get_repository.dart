import '../../app_vendor_export.dart';

abstract class IGetRepository{
  Future<List<ResponseEntity>> get();
}