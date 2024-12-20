import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/controllers/utils/custom_button.dart';
import 'package:nots_app/controllers/utils/text_direction.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/views/home_view/widgets/colors_item.dart';

class CustomNoteInput extends StatefulWidget {
  const CustomNoteInput({super.key});

  @override
  State<CustomNoteInput> createState() => _CustomNoteInputState();
}

class _CustomNoteInputState extends State<CustomNoteInput> {
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Color(0xff732D1A),
    Colors.orangeAccent,
    Colors.purpleAccent,
    Color(0xffC2C0A6),
    Color(0xff4B4952),
    Color(0xff486241),
    Color(0xff03A688),
    Color(0xff7A6D31),
    Color(0xffA8B545),
    Color(0xff7A577A),
    Color(0xff8C034E),
    Color(0xff001542),
  ];

  Color selectedColor = Colors.blueAccent;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SizedBox(
        height: 480.h,
        width: 300.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).title_req;
                }
                return null;
              },
              decoration: _inputDecoration(S.of(context).title_txt),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              maxLines: 2,
              textDirection: getTextDirection(titleController.text),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: subtitleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).subtitle_req;
                }
                return null;
              },
              decoration: _inputDecoration(S.of(context).subtitle_txt),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              maxLines: 5,
              textDirection: getTextDirection(subtitleController.text),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 35.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: colors.map((color) {
                    return ColorsItem(
                      color: color,
                      isSelected: color == selectedColor,
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            AddNoteButton(
              buttonName: S.of(context).add_btn,
              formKey: formKey,
              selectedColor: selectedColor,
              titleController: titleController,
              subtitleController: subtitleController,
              onSaveSuccess: () {
                Navigator.of(context).pop();
              },
              setAutovalidateMode: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

 

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      filled: true,
      fillColor: Theme.of(context).scaffoldBackgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
