part of 'otp_auth_bloc.dart';

@immutable
sealed class OtpAuthEvent {}

class GetOtpEvent extends OtpAuthEvent {
  final String phonenumber;

  GetOtpEvent({required this.phonenumber});
}
