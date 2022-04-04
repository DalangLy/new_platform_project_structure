import '../../app_vendor_export.dart';

abstract class IGetByIdRepository{
  Future<ResponseEntity> getById({required String id,});
}