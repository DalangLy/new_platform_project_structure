import '../../app_vendor_export.dart';

abstract class IDeleteDataSource{
  Future<String> delete({required DeleteEntity entity,});
}