import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}


class HomeState extends State{
  void onPressedbtn()async{
//    Map data =await getData();
//    print(data['location']);
    Map Clickme=await getData();
    print(Clickme);
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weather"),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new IconButton(
            icon:new Icon(Icons.home) ,
            onPressed: onPressedbtn ,

          )
        ],
      ),
      body:new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('image/thunder-striking-a-building-photo-680940.jpg',
            fit:BoxFit.cover ,
              height: 2200,
              width: 3200,

            ),
          ),
          new Container(
            margin:EdgeInsets.only(left: 40.0),
             padding: EdgeInsets.all(40.0),
            child: new Text("united state",
            style: TextStyle(
              fontSize: 22.0,
              fontStyle:  FontStyle.italic,
              color:Colors.white,
              fontWeight: FontWeight.w700,

            ),

            ),
          ),
          new Container(
            child: new Image.asset("image/cloud.png",
              height: 100.0,
//              width: 40.0,

            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 34),
            padding:EdgeInsets.only(top: 166),

           child:widgetmyData(),
          ),
        ],
      ),
    );
  }
//  Future <Map> getMyData() async{
//    String myUrl="http://api.weatherstack.com/current?access_key=96d857c447a50f9d324a36e8d0fef250&query=New%20York";
//    http.Response response= await http.get(myUrl);
//    return json.decode(response.body);
//}
  Future<Map> getData() async {
    String myurl = "http://api.weatherstack.com/current?access_key=96d857c447a50f9d324a36e8d0fef250&query=New%20York";
    http.Response response = await http.get(myurl);
    return json.decode(response.body);
  }

  Widget widgetmyData(){
    return new FutureBuilder(future: getData(),
        builder:(BuildContext context,AsyncSnapshot<Map>snapshot){
          if(snapshot.hasData){
            Map content=snapshot.data;
             return new Container(
                child: new ListTile(
                 title: new Text(content['current']['temperature'].toString(),
                    style: TextStyle(
                      fontSize: 44.0,
                      fontStyle:  FontStyle.italic,
                      color:Colors.pink.shade900,
                      fontWeight: FontWeight.w700,



                    ),
                  ),

       ),
     );
    }
          else{
            return new Container(

            );
          }
  });
  }
}

