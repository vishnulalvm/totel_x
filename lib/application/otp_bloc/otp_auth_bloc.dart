import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_auth_event.dart';
part 'otp_auth_state.dart';

class OtpAuthBloc extends Bloc<OtpAuthEvent, OtpAuthState> {
  OtpAuthBloc() : super(OtpAuthInitial()) {
    on<OtpAuthEvent>((event, emit) {
    emit(OtpAuthInitial());
    });

    on<GetOtpEvent>((event,emit){
      // ! 

    });
  }
}
