import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:totel_x/presentation/screens/widgets/utils/colors/font_color.dart';
import 'package:totel_x/presentation/screens/widgets/utils/text/modified_text.dart';

class UserlistSection extends StatefulWidget {
  final ScrollController scrollController;
  const UserlistSection({super.key, required this.scrollController});

  @override
  State<UserlistSection> createState() => _UserlistSectionState();
}

class _UserlistSectionState extends State<UserlistSection> {
  
  @override
  Widget build(BuildContext context) {
    return        Expanded(
            child: ListView.builder(
              controller:widget.scrollController,
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                  child: IntrinsicHeight(
                    child: OpenContainer(
                      openColor: Colors.white,
                      transitionDuration: Durations.long2,
                      transitionType: ContainerTransitionType
                          .fadeThrough, // Adjust the transition type as needed
                      openBuilder: (BuildContext context, VoidCallback _) {
                        return const SizedBox();
                      },
                      closedElevation: 1,
                      closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      closedColor: Colors.white,
                      closedBuilder:
                          (BuildContext context, VoidCallback openContainer) {
                        return ListTile(
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
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
  }
}