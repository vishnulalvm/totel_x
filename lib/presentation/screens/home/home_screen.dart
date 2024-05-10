import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:totel_x/presentation/screens/home/widgets/bottom_sheet.dart';
import 'package:totel_x/presentation/screens/widgets/global_widgets/scroll_to_hide.dart';
import 'package:totel_x/presentation/screens/widgets/utils/colors/font_color.dart';
import 'package:totel_x/presentation/screens/widgets/utils/text/modified_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(22)),
                    child: TextField(
                      cursorWidth: 0,
                      cursorHeight: 0,
                      onTap: () async {},
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                          hintText: 'Search by name',
                          hintStyle: TextStyle()),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    showBottomSheet(context);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'User List',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: IntrinsicHeight(
                    child: OpenContainer(
                      openColor: Colors.white,
                      transitionDuration: Durations.long2,
                      transitionType: ContainerTransitionType
                          .fadeThrough, // Adjust the transition type as needed
                      openBuilder: (BuildContext context, VoidCallback _) {
                        return const SizedBox();
                      },
                      closedElevation: 0,
                      closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      closedColor: Colors.white,
                      closedBuilder:
                          (BuildContext context, VoidCallback openContainer) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: ListTile(
                            onTap: () {
                              openContainer();
                            },
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue,
                            ),
                            subtitle: const ModifiedText(
                                text: 'Age: 34', size: 12, color: Colors.black),
                            title: ModifiedText(
                              text: 'Martin Dokid',
                              size: 13,
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
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
          title: const Text('Add A New User'),
          content: Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            height: 322,
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 42.5,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    Icon(Icons.photo_camera)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text('Name'),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  // controller: newupdateController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Add A New User ',
                    hintStyle:
                        const TextStyle(color: Colors.black54, fontSize: 14),
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
                const SizedBox(
                  height: 12,
                ),
                const Text('Name'),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  // controller: newupdateController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Add A New User ',
                    hintStyle:
                        const TextStyle(color: Colors.black54, fontSize: 14),
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
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 28,
                width: 95,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(204, 204, 204, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: ModifiedText(
                      text: 'Cancel', size: 12, color: Colors.grey),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 28,
                width: 95,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(23, 130, 225, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child:
                      ModifiedText(text: 'Save', size: 12, color: Colors.white),
                ),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: const Text('Cancel'),
            // ),
            // ElevatedButton(

            //   onPressed: () async {
            //     // String update = newupdateController.text;

            //     Navigator.of(context).pop();
            //   },
            //   child: const Text('Save',),
            // ),
          ],
        );
      },
    );
  }

  void showBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return const BottomSheetWidget();
    },
  );
}
}
