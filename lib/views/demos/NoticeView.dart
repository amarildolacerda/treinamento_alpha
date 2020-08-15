import 'package:controls_web/controls/notice_activities.dart';
import 'package:flutter/material.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        NoticeTitle(
          title: 'NoticeTitle',
        ),
        NoticeTag(
          //  text: 'Texto para Notice Tag',
          content: Text('Content Notice Tag'),
        ),
        NoticeBox(
          child: Text('NoticeBox'),
        ),
        NoticeButton(
          child: Text('NoticeButton'),
        ),
        NoticeHeader(
          title: 'NoticeHeader',
          subtitle: 'subtitle',
        ),
        NoticeTile(
          title: 'NoticeTile',
        ),
        NoticeInfo(
          child: Text('NoticeInfo'),
        ),
      ]),
    );
  }
}
