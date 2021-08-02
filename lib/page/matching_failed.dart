import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:ring_sns/api/auth.dart';
import 'package:flutter/material.dart';
import 'package:ring_sns/page/chat.dart';
import 'package:ring_sns/page/home.dart';
import 'package:flutter/rendering.dart';

class Match_Failed extends StatefulWidget{
  Match_Failed(this.auth);
  Auth auth;
  @override
  State<StatefulWidget> createState() => _Match_Failed();

}

class _Match_Failed extends State<Match_Failed>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://user-imgs.p0x0q.com/thumbnail/user/1.jpg'),
              radius: 100,
            ),
            Text(
              'マッチングに失敗しました',
              style: Theme.of(context).textTheme.headline6,
            ),

            
            
            //Divider(),
            // Indeterminate
            //CircularProgressIndicator(),
            RaisedButton(
              child: Text('homeに戻る'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(widget.auth)),
                );
              },
            ),
            
            
           
          ],
        ),
      ),
    );
    
  }
  
}