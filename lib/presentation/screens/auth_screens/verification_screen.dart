import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:totel_x/presentation/screens/widgets/utils/text/modified_text.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/Group.jpg'),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const ModifiedText(
                  text: 'OTP Verification',
                  size: 14,
                  color: Color.fromRGBO(51, 51, 51, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const ModifiedText(
                  text:
                      'Enter the verification code we just sent to your number +91 *******21.',
                  size: 14,
                  color: Colors.grey),
              const SizedBox(height: 20),
              PinCodeFields(
                  // controller: otpController,
                  length: 6,
                  fieldBorderStyle: FieldBorderStyle.square,
                  fieldHeight: 60,
                  borderWidth: 1.0,
                  activeBorderColor: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  keyboardType: TextInputType.number,
                  onComplete: (value) {
                    // BlocProvider.of<OtpBloc>(context).add(
                    //     VerifySentOtp(
                    //         otpCode: otpController.text,
                    //         verificationId: id));
                  }),
              const SizedBox(height: 20),
              const Center(
                child:
                    ModifiedText(text: '59 sec', size: 11, color: Colors.red),
              ),
              const SizedBox(height: 20),
              const Center(
                child: ModifiedText(
                    text: 'Dont get OTP? Resend', size: 11, color: Colors.red),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(16, 14, 9, 1),
                      borderRadius: BorderRadius.circular(22)),
                  child: const Center(
                    child: ModifiedText(
                        text: 'Verify', size: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
