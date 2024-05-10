import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:totel_x/domain/models/user_model/user.dart';
import 'package:totel_x/infrastructure/provider/user_data.dart';
import 'package:totel_x/presentation/screens/home/widgets/search_section.dart';
import 'package:totel_x/presentation/screens/home/widgets/userlist_section.dart';
import 'package:totel_x/presentation/screens/widgets/global_widgets/scroll_to_hide.dart';
import 'package:totel_x/presentation/screens/widgets/global_widgets/widget_gap.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:totel_x/presentation/screens/widgets/utils/text/modified_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(16, 14, 9, 1),
        title: const Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            Text(
              'Nilambur',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SearchSection(),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
            child: Text(
              'User Lists',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          // const SizedBox(height: 10),
          UserlistSection(
            scrollController: scrollController,
          ),
        ],
      ),
      floatingActionButton: ScrollToHide(
        height: 60,
        hideDirection: Axis.vertical,
        scrollController: scrollController,
        child: FloatingActionButton(
          // backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          onPressed: () {
            showLogoutDialog(context);
          },
          child: const Icon(
            Icons.add,
            weight: 800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const ModifiedText(
              text: 'Add A New User', size: 13, color: Colors.black),
          content: Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            height: 322,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blue,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 74,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(1, 40, 95, .75),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child:
                               IconButton(
                                      onPressed: () {
                                        pickProfileImage();
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        size: 24,
                                        color: Colors.white,
                                      )),
                        ),
                      ),
                    ],
                  ),
                ),
                space(height: 12),
                const Text(
                  'Name',
                  style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
                ),
                space(height: 12),
                TextFormField(
                  controller: nameController,
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
                      borderRadius:
                          BorderRadius.circular(5.0), // Rounded border
                      borderSide:
                          const BorderSide(color: Colors.blue), // Border color
                    ),
                  ),
                ),
                space(height: 12),
                const Text(
                  'Age',
                  style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
                ),
                space(height: 12),
                TextFormField(
                   controller: ageController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter Age ',
                    hintStyle:
                        const TextStyle(color: Colors.black54, fontSize: 13),
                    filled: true,
                    fillColor: Colors.white, // Background color
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), // Rounded border
                      // borderSide: BorderSide.none, // No border side
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), // Rounded border
                      borderSide:
                          const BorderSide(color: Colors.blue), // Border color
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            buttons(
              buttonName: 'Cancel',
              textColor: Colors.black87,
              color: const Color.fromRGBO(204, 204, 204, 1),
             onTap: () {
                Navigator.of(context).pop();
             },
            ),
            buttons(
              buttonName: 'Save',
              textColor: Colors.white,
              color: const Color.fromRGBO(23, 130, 225, 1),
             onTap: () {
                final name = nameController.text;
              final age = int.tryParse(ageController.text) ?? 0;
              // Handle image upload and get the imageUrl if needed

              final userModel = UserModel(
                name: name,
                age: age,
                // imageUrl: imageUrl, // Replace with the actual image URL
              );

              context.read<UserProvider>().addUser(userModel);
              Navigator.of(context).pop();
             },
            ),
          ],
        );
      },
    );
  }

Widget buttons({
  required VoidCallback onTap,
  required String buttonName,
  Color? color,
  required Color textColor,
}) {
  return InkWell(
    onTap: onTap, // Call the provided function when tapped
    child: Container(
      height: 28,
      width: 95,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: ModifiedText(
          text: buttonName,
          size: 12,
          color: textColor,
        ),
      ),
    ),
  );
}


Future<String?> pickProfileImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Upload the image to Firebase Storage and get the download URL
    String imageUrl = await uploadImageToFirebaseStorage(pickedFile.path);
    return imageUrl;
  }

  return null;
}

Future<String> uploadImageToFirebaseStorage(String filePath) async {
  File file = File(filePath);

  try {
    // Create a reference to the Firebase Storage location
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    // Upload the file to Firebase Storage
    firebase_storage.UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() => null);

    // Get the download URL
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  } catch (e) {
    print('Error uploading image: $e');
    return '';
  }
}
}
