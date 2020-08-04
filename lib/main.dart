import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
// App Bar
          AppBar(),
        ],
      ),
    );
  }
}

class AppBar extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .45,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: size.height * .45 - 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                ),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "All you need is\nstay at home",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),

//Search bar
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width * .60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: Colors.black26.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            hintText: "Search Country",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: FlareActor(
                    "assets/animations/covid_19.flr",
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    animation: "Hello",
                  ),
                )
              ],
            ),
          ),

//Main Counter
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: Colors.black26.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  mainCounter(
                      size: size,
                      title: "Cases",
                      numbers: "18,118,726",
                      color: Colors.amberAccent),
                  mainCounter(
                    size: size,
                    title: "Deaths",
                    numbers: "690,514",
                    color: Colors.redAccent,
                  ),
                  mainCounter(
                    size: size,
                    title: "Recovered",
                    numbers: "11,397,014",
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Title & Number
class mainCounter extends StatelessWidget {
  final String title;
  final String numbers;
  final color;

  const mainCounter({
    Key key,
    @required this.size,
    this.title,
    this.numbers,
    this.color,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          numbers,
          style: TextStyle(
              fontSize: 20, color: color, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: color.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
