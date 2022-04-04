import '../../app_vendor_export.dart';

abstract class IDeleteRepository{
  Future<String> delete({required DeleteEntity entity,});
}