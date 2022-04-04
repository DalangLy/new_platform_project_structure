import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../core_export.dart';

part 'start_up_check_auth_event.dart';
part 'start_up_check_auth_state.dart';

class StartUpCheckAuthBloc extends Bloc<StartUpCheckAuthEvent, StartUpCheckAuthState> {
  final TokenDataSource _tokenDataSource;
  StartUpCheckAuthBloc({required Dio httpClient, required TokenDataSource tokenDataSource,}) : _tokenDataSource = tokenDataSource, super(StartUpCheckAuthInitial()) {
    on<StartUpCheckAuthEvent>((event, emit) async{
      if(event is CheckAuth){
        emit(const CheckAuthInProgress());
        final TokenModel f = await _tokenDataSource.checkTokenInStorage();
        if(f.token.isNotEmpty){
          emit(const CheckAuthSuccess(),);
        }
        else{
          emit(const CheckAuthFailed(message: 'Unauthenticated'));
        }
        // try{
        //   final Response response = await _httpClient.get('https://run.mocky.io/v3/d3ec2651-3767-4e95-97c3-f0808a2a71d5');
        //   if(response.statusCode == 200){
        //     emit(const CheckAuthSuccess(),);
        //   }
        // }on DioError catch(e){
        //   if(e.response?.statusCode == 401){
        //     emit(const CheckAuthFailed(message: 'Unauthenticated'));
        //   }
        // }
      }
    });
  }
}
