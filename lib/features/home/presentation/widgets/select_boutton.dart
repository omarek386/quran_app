import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/themes/app_color.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  String? _selectedOption; // Use nullable String

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Center the buttons
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color:
                  _selectedOption == "Surat" ? AppColor.primary : Colors.black,
            ), // Black border for unselected.,
            backgroundColor:
                _selectedOption == 'Surat'
                    ? AppColor.primary
                    : Colors.white, //Conditional coloring
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
          ),
          onPressed: () {
            setState(() {
              _selectedOption = 'Surat';
            });
          },
          child: Text(
            'Surat',
            style: TextStyle(
              color: _selectedOption == 'Surat' ? Colors.white : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 20), // Space between buttons
        OutlinedButton(
          //Use outlined button for non-selected
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black, // Black text
            backgroundColor:
                _selectedOption == 'Doa'
                    ? AppColor.primary
                    : Colors.white, // Conditional coloring
            side: BorderSide(
              color: _selectedOption == "Doa" ? AppColor.primary : Colors.black,
            ), // Black border for unselected.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          onPressed: () {
            setState(() {
              _selectedOption = 'Doa';
            });
          },
          child: Text(
            'Doa',
            style: TextStyle(
              color: _selectedOption == 'Doa' ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
