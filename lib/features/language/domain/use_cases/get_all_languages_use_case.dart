import '../../../../app_vendor/app_vendor_export.dart';

class GetAllLanguagesUseCase implements IGetUseCase{
  final IGetRepository _repository;

  GetAllLanguagesUseCase(this._repository);

  @override
  Future<List<ResponseEntity>> call() {
    return _repository.get();
  }
}