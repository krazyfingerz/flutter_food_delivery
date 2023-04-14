import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../sharedcomponents/scroller.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffdbdbdb),
          borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: LayoutBuilder(builder: (context, constraints) {
          double w = constraints.maxWidth - 24;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.location_on, size: 24),
              SizedBox(
                width: w * 0.7,
                child: InkWell(
                  child: const Scroller(
                    animationDuration: Duration(seconds: 6),
                    child: Text(
                      "Test Location",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              InkWell(
                child: SizedBox(
                  width: w * 0.3,
                  child: Chip(
                    backgroundColor: Colors.white54,
                    avatar: const Icon(Icons.access_time),
                    label: Scroller(
                      animationDuration: const Duration(seconds: 3),
                      child: Text(
                        "${date.hour}:${date.minute}, ${date.day}/${date.month}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => Container(
                      height: 216,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        initialDateTime:
                            DateTime.now().add(const Duration(minutes: 20)),
                        minimumDate:
                            DateTime.now().add(const Duration(minutes: 19)),
                        maximumDate:
                            DateTime.now().add(const Duration(days: 7)),
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        onDateTimeChanged: (DateTime dateTime) {
                          // setState(() {
                          //   date = dateTime;
                          // });
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
