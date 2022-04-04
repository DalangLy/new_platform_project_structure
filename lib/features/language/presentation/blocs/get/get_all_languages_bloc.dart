import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../app_vendor/app_vendor_export.dart';

part 'get_all_languages_event.dart';
part 'get_all_languages_state.dart';

class GetAllLanguagesBloc extends Bloc<GetAllLanguagesEvent, GetAllLanguagesState> {
  final IGetUseCase _useCase;
  GetAllLanguagesBloc(this._useCase) : super(GetAllLanguagesInitial()) {
    on<GetAllLanguagesEvent>((event, emit) async{
      if(event is GetAllLanguages){
        emit(GetAllLanguagesInProgress());
        try{
          final List<ResponseEntity> data = await _useCase();
          emit(GetAllLanguagesSuccess(data: data));
        }
        on Failure catch(e){
          emit(GetAllLanguagesFailed(message: e.message));
        }
        catch(e){
          emit(GetAllLanguagesFailed(message: e.toString()));
        }
      }
    });
  }

  void load(){
    add(GetAllLanguages());
  }
}
