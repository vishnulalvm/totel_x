import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
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
                      border: Border.all()
                    ),
                    child: TextField(
                      cursorWidth: 0,
                      cursorHeight: 0,
                      onTap: () async {},
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                          hintText: 'Search by name',
                          hintStyle: TextStyle()),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Icon(Icons.sort),
                )
              ],
            ),
          ),
          Text('User List'),
          SizedBox(height: 10),
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
                        return SizedBox();
                      },
                      closedElevation: 0,
                      closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      closedColor: Colors.white,
                      closedBuilder:
                          (BuildContext context, VoidCallback openContainer) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Card(

                            color: Colors.white,
                            elevation: 0,
                            child: ListTile(

                              
                              onTap: () {
                                openContainer();
                              },
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blue,
                              ),
                              title: ModifiedText(
                                text: 'hidff',
                                size: 16,
                                color: AppColor.fontColor,
                                fontWeight: FontWeight.w500,
                              ),
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
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            weight: 800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
