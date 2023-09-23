import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.width / 3,
      child: Center(
        child: TextFormField(
          controller: dateInput,
          // Editing controller of this TextField
          decoration: InputDecoration(
            hintText: "yy/mm/dd",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18.sp), // Adjust the color and font size as needed
            // labelText: "Select date",
            // labelStyle: TextStyle(
            //   color: AppColors.black,
            //   fontSize: 16.sp,
            // ),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                dateInput.text = formattedDate;
              });
            } else {}
          },
        ),
      ),
    );
  }
}
