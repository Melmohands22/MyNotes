import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/views/tasks_view/widgets/botttom_tasks_section.dart';
import 'package:nots_app/views/tasks_view/widgets/days_card.dart';
import 'package:nots_app/views/tasks_view/widgets/head_tasks_section.dart';
import 'package:nots_app/views/tasks_view/widgets/sub_tasks_sectiion.dart';
import 'package:nots_app/views/tasks_view/widgets/tasks_head_icon.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});
  static String id = "TasksView";

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  height: 360.h,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          TasksHeadIcons(),
                          HeadTasksSection(),
                          SubTasksSection(),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: i == 0 ? 38 : 14, top: 24),
                                    child: DaysCard(
                                      dayNum:
                                          (i + 1).toString().padLeft(2, '0'),
                                      dayChar: ["M", "T", "W", "Th", "F"][i],
                                      isSelected: selectedIndex == i,
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = i;
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BottomTasksSection(),
          ],
        ),
      ),
    );
  }
}
