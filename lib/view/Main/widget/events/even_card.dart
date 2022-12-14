import 'package:care_square_assignment/model/global_functions.dart';
import 'package:care_square_assignment/view/Main/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../model/event_model.dart';
import '../../../Event/event_detail_page.dart';

class EventCardTile extends StatefulWidget {
  final CalendarEventModel event;
  const EventCardTile({Key? key, required this.event}) : super(key: key);

  @override
  State<EventCardTile> createState() => _EventCardTileState();
}

class _EventCardTileState extends State<EventCardTile> {
  late String startTime, endTime;

  @override
  Widget build(BuildContext context) {
    // get the brightness of the device

    return CupertinoButton(
      padding: const EdgeInsets.all(0),

      //* 이벤트 상세 페이지로 이동
      onPressed: () => showCupertinoModalBottomSheet(
        enableDrag: false,
        context: context,
        builder: (context) => EventDetailPage(
          event: widget.event,
        ),
      ).then(
        (value) => {eventListKey.currentState?.setState(() {})},
      ),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        //
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black38,
            //     offset: Offset(3, 3),
            //     blurRadius: 5,
            //   )
            // ],
          ),
          child: Row(
            children: [
              //
              //* 날짜
              SizedBox(
                child: (widget.event.allDay)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '하루종일',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    : time(),
              ),

              //
              const SizedBox(
                width: 5,
              ),

              // 구분선
              Container(
                width: 5,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.yellow, // widget.event.account.color,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              //
              const SizedBox(
                width: 5,
              ),

              Container(
                padding: const EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* 제목
                    Text(
                      widget.event.title,
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),

                    //* 메모
                    if (widget.event.memo != null)
                      Text(
                        widget.event.memo!,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget time() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
      child: Column(
        children: [
          // 시작 시간
          Text(
            formatTime(widget.event.startTime),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),

          // 끝나는 시간
          Text(
            formatTime(widget.event.endTime),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
