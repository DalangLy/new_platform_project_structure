import '../../app_vendor_export.dart';

abstract class IUpdateRepository{
  Future<ResponseEntity> update({required RequestEntity entity,});
}