import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../provider/dates.dart';

import '../back_to_now.dart';

class CalendarAppBar extends StatefulWidget {
  const CalendarAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          //* Month
          Consumer(
            builder: (ctx, ref, child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
                child: Text(
                  ref.watch(currentMonthProvider).toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff313131)),
                ),
              );
            },
          ),

          //
          const Spacer(),

          //* Back to today
          Consumer(
            builder: (ctx, ref, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: ref.watch(currentMonthProvider) != DateTime.now().month
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: BackToNow(),
                      )
                    : null,
              );
            },
          ),

          //* Search button
          CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.search,
                color: Color(0xff313131),
                size: 25,
              )),

          //* calendar accounts button
          CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.calendar,
                color: Color(0xff313131),
                size: 25,
              )),

          //* setting button
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            child: const Icon(
              Icons.settings,
              color: Color(0xff313131),
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}