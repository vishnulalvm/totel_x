import 'package:flutter/material.dart';
import 'package:totel_x/presentation/screens/widgets/utils/text/modified_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  height: 103,
                  width: 130,
                  child: Image.asset('assets/images/OBJECTS.jpg'),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const ModifiedText(
                  text: 'Enter Phone Number',
                  size: 14,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.phone,
                // controller: newup
                // dateController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                decoration: InputDecoration(

                  hintText: 'Add A New User ',
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: Colors.white, // Background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(0, 0, 0, .4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded border
                    borderSide:
                        const BorderSide(color: Colors.blue), // Border color
                  ),
                ),
              ),
              const ModifiedText(
                  text:
                      'By Continuing I agree to TotalX \'s Terms and condition ',
                  size: 11,
                  color: Colors.grey),
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
                      text: 'Get Otp', size: 14, color: Colors.white),
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
