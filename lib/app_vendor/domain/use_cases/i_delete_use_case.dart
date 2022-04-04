import '../../app_vendor_export.dart';

abstract class IDeleteUseCase{
  Future<String> call({required DeleteEntity entity,});
}