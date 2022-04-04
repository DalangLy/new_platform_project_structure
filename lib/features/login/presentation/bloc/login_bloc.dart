import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../app_vendor/app_vendor_export.dart';
import '../../login_export.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _useCase;
  LoginBloc(this._useCase,) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      if(event is Login){
        emit(LoginInProgress());
        try{
          final bool data = await _useCase(json: event.json,);

          emit(LoginSuccess());
        }
        on Failure catch(failure){
          emit(LoginFailed());
        }catch(e){
          emit(LoginFailed());
        }
      }
    });
  }

  void login(Map<String, dynamic> json,){
    add(Login(json: json));
  }
}
