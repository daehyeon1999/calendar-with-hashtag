import 'package:care_square_assignment/view/New%20Event/new_event_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddNewEvent extends StatelessWidget {
  const AddNewEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          //* Add new Event
          Expanded(
              child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            width: 75,
            height: 60,
            decoration: BoxDecoration(
                color: const Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(10)),
            child: CupertinoButton(
              //
              //* Show adding event page
              onPressed: () => showCupertinoModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const AddNewEventPage(),
              ),

              //
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  //

                  // + icon

                  Icon(
                    CupertinoIcons.add,
                    color: Colors.black,
                    size: 30,
                  ),

                  //
                  SizedBox(
                    width: 10,
                  ),

                  // text
                  Text(
                    "새로운 이벤트",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          )),

          //* Template
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.fromLTRB(5, 10, 10, 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icon/document.svg',
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}