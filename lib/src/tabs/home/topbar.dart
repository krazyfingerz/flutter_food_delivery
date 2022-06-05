import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/scroller.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(color: const Color(0xffdbdbdb), borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double w = constraints.maxWidth - 24;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.location_on, size: 24),
                SizedBox(
                  width: w*0.7,
                  child: InkWell(
                    child: const Scroller(
                      animationDuration: Duration(seconds: 6),
                      child: Text(
                        "Test Location",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                InkWell(
                  child: SizedBox(
                    width: w*0.3,
                    child: Chip(
                      backgroundColor: Colors.white54,
                      avatar: const Icon(Icons.access_time),
                      label: Scroller(
                        animationDuration: const Duration(seconds: 3),
                        child: Text(
                          date.hour.toString() + ":" + date.minute.toString() + ", " + date.day.toString() + "/" + date.month.toString(),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                          initialDateTime: DateTime.now().add(Duration(minutes: 20)),
                          minimumDate: DateTime.now().add(Duration(minutes: 19)),
                          maximumDate: DateTime.now().add(Duration(days: 7)),
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
          }
        ),
      ),
    );
  }
}