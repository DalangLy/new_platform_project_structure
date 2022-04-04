import '../../../../app_vendor/app_vendor_export.dart';
import '../../language_export.dart';

class LanguageRepository implements ILanguageRepository{
  final ILanguageRemoteDataSource _remoteDataSource;

  LanguageRepository(this._remoteDataSource);

  @override
  Future<ResponseEntity> create({required RequestEntity entity}) {
    return _remoteDataSource.create(entity: entity);
  }

  @override
  Future<List<ResponseEntity>> get() {
    return _remoteDataSource.get();
  }
}