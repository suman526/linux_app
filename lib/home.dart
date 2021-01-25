import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://www.desktopbackground.org/download/o/2011/12/19/314752_wallpapers-eye-abstract-linux-1024-x-768-operating-system_1024x768_h.jpg'),
                        fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            spreadRadius: 50,
                            blurRadius: 200,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.shade100,
                            Colors.red,
                          ],
                        )),
                    child: Container(
                      
                      margin: EdgeInsets.all(30),
                      /*decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://www.linux.com/wp-content/uploads/2019/08/linux-arm.png'),
                        fit: BoxFit.fill)
                      ), */
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          Text(
                            "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              fontStyle: FontStyle.italic,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(
              //height: 35,
              //),

              Container(
                
                margin: EdgeInsets.all(30),
                width: 200,
                height: 100,
                child: RaisedButton(
                  onPressed: () => { Navigator.pushNamed(context, "login")},
                  color: Colors.blue[300],
                  child: Text("Login",
                      style: TextStyle(
                        color: Colors.indigo,
                        decorationStyle: TextDecorationStyle.wavy,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ),
              new MaterialButton(
                height: 100.0,
                minWidth: 200.0,
                color: Theme.of(context).backgroundColor,
                textColor: Colors.indigoAccent,
                child: new Text("Registration",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'hind'
                ),),
                //textTheme:new TextTheme({ headline:
                  //    TextStyle(fontSize: 25, fontStyle: FontStyle.italic)
                //}),
                onPressed: () => {  Navigator.pushNamed(context, "reg")},
                splashColor: Colors.redAccent,
              ),
            ],
          ),
        )));
  }
}
