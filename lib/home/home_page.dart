import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Work With DateTime Picker',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2020, 1, 1),
                maxTime: DateTime(2024, 12, 30), onChanged: (date) {
              debugPrint('change $date');
            }, onConfirm: (date) {
              debugPrint('Date Time $date');
            }, currentTime: DateTime.now(), locale: LocaleType.ru);
          },
          child: const Text(
            'show date time picker (Chinese)',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
