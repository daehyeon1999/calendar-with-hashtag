import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../model/repeat_enum.dart';
import '../Repeat/repeat_pick.dart';

class RepeatWidget extends StatefulWidget {
  const RepeatWidget({Key? key}) : super(key: key);

  @override
  State<RepeatWidget> createState() => _RepeatWidgetState();
}

class _RepeatWidgetState extends State<RepeatWidget> {
  Repeat repeat = Repeat.none;

  //
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
            builder: (context) => RepeatSelectPage(
              repeat: repeat,
            ),
          ).then((repeat) => setState(
                () => this.repeat = repeat,
              )),
          child: SizedBox(
            child: repeat == Repeat.none
                ? Text(
                    //* no repeat
                    convertRepeat(repeat),
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                : Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xfff4f4f4)),
                    child: Text(convertRepeat(repeat)),
                  ),
          ),
        )
      ],
    );
  }
}