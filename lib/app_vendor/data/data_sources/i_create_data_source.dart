import '../../app_vendor_export.dart';

abstract class ICreateDataSource{
  Future<ResponseEntity> create({required RequestEntity entity,});
}