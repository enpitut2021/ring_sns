import 'package:flutter/material.dart';
//import 'package:html_unescape/html_unescape_small.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ring_sns/api/chatAPI.dart';
import 'package:ring_sns/api/auth.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:ring_sns/page/chat.dart';

class ChatHistory extends StatefulWidget {
  ChatHistory(this.auth);
  Auth auth;
  IconData icon;
  String roomid;
  @override
  State<StatefulWidget> createState() => _ChatHistory();
}

class _ChatHistory extends State<ChatHistory> {
  @override
  List<ListTile> chathis = [];
  ChatAPI chatapi;

  void chathistory_update(String chatroom_id) {
    setState(() {
      chathis.add(ListTile(
        title: Text(chatroom_id),
        onTap: () {

        },
      ));
    });
  }

  @override
  void initState() {
    chatapi = new ChatAPI(widget.auth.getBearer());
    // print("ok");
    // print(widget.auth.getBearer());
    // chatapi.getChatHistory();

    chatapi.getChatHistory().then((Map history) => {
          history.forEach((roomId, value) {
            setState(() {
              chathis.add(ListTile(
                title: Text(roomId),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatDemo(roomId, widget.auth)),
                  );
                },
              ));
            });
          })
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("チャット"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 600,
              width: double.infinity,
              child: ListView.builder(
                itemCount: chathis.length,
                itemBuilder: (BuildContext context, int index) {
                  return chathis[index];
                },
              ),
            ),
            // Row(
            //   children: [
            //     RaisedButton(onPressed: () {
            //       chathistory_update("new_room");
            //     })
            //   ],
            // )
          ],
        ));
  }
}
