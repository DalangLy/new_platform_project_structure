import '../../app_vendor_export.dart';

abstract class ICreateRepository{
  Future<ResponseEntity> create({required RequestEntity entity,});
}