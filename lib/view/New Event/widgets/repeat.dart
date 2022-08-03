import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../data/repeat_enum.dart';
import '../Repeat/repeat_pick.dart';

class RepeatWidget extends StatefulWidget {
  const RepeatWidget({Key? key}) : super(key: key);

  @override
  State<RepeatWidget> createState() => _RepeatWidgetState();
}

class _RepeatWidgetState extends State<RepeatWidget> {
  Repeat repeat = Repeat.none;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        const Icon(
          CupertinoIcons.refresh_thin,
          size: 20,
        ),

        const SizedBox(
          width: 10,
        ),

        //* Reapeat button
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () => showCupertinoModalBottomSheet(
            useRootNavigator: true,
            context: context,
            builder: (context) => RepeatSelectPage((r) {
              //* update the repeat
              setState(() {
                repeat = r;
              });
            }),
          ),
          child: SizedBox(
            child: repeat == Repeat.none
                ? Text(
                    //* no repeat
                    convertEnum(repeat),
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                : const SizedBox(),
          ),
        )
      ],
    );
  }
}
