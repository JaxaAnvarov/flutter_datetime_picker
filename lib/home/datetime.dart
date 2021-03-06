import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimee extends StatefulWidget {
  const DateTimee({Key? key}) : super(key: key);

  @override
  State<DateTimee> createState() => _DateTimeeState();
}

class _DateTimeeState extends State<DateTimee> {
  DateTime dateTime = DateTime(2016, 08, 03, 17, 45);
  DateTime? newDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work With DateTime'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Date Time',
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              // Display a CupertinoDatePicker in dateTime picker mode.
              onPressed: () {
                debugPrint(
                    "Date time 'oy ${dateTime.month}- kun ${dateTime.day}- yil ${dateTime.year}  soat ${dateTime.hour}: minut${dateTime.minute}");
                _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: dateTime,
                    use24hFormat: true,
                    // This is called when the user changes the dateTime.
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() => dateTime = newDateTime);
                      debugPrint("New Date Time $newDateTime");
                    },
                  ),
                );
              },
              // In this example, time value is formatted manually. You can use intl package to
              // format the value based on the user's locale settings.
              child: Text(
                '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                // 'New  Date $dateTime',
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
