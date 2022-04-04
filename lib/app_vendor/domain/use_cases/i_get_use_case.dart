import '../../app_vendor_export.dart';

abstract class IGetUseCase{
  Future<List<ResponseEntity>> call();
}