import 'package:covid_19/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

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
  List<Country> countryForDisplay = countrys;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(),

          // CASE NEW
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.flag, color: Colors.redAccent,),
                Text(
                  "333 new cases ",
                  style: TextStyle(fontSize:20, color: Colors.redAccent),
                ),
                Text(
                    "in ",
                  style: TextStyle(fontSize:17, color: Colors.grey),
                ),
                Text(
                  "USA",
                  style: TextStyle(fontSize:20, color: Colors.blueAccent),
                ),
              ],
            ),
          ),

          // LIST COUNTRY
          Expanded(
              child: ListView.builder(
                itemCount: countryForDisplay.length,
                itemBuilder: (context, index) => CountryCard(
                  itemIndex: index,
                  country: countryForDisplay[index],
                ),
              )
          ),
        ],
      ),
    );
  }

  // APP BAR
  AppBar () {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .40,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: size.height * .40 - 35,
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
                Expanded(
                  child: FlareActor(
                    "assets/animations/covid.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: countryForDisplay.isEmpty ? "Buon" : "Hello",
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "All you need is\nstay at home",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),

//Search bar
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width * .55,
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
                        onChanged: (text) {
                          text = text.toLowerCase();
                          setState(() {
                            countryForDisplay = countrys.where((contry) {
                              var contryName = contry.name.toLowerCase();
                              return contryName.contains(text);
                            }).toList();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

//Main Counter
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MainCounter(
                    size: size,
                    title: "Total Cases",
                    numbers: "18,118,726",
                    color: Colors.amberAccent),
                MainCounter(
                  size: size,
                  title: "Total Deaths",
                  numbers: "690,514",
                  color: Colors.redAccent,
                ),
                MainCounter(
                  size: size,
                  title: "Total Recovered",
                  numbers: "11,397,014",
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ITEM COUNTRY
class CountryCard extends StatelessWidget {
  final int itemIndex;
  final Country country;

  const CountryCard({
    Key key, this.itemIndex, this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 20,
            color: Colors.black26.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[

          // FLAG
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black26.withOpacity(0.2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    country.flag,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // NAME COUNTRY
              Text(
                country.name,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(offset: Offset(0, 10), blurRadius: 30, color: Colors.grey)
                  ],
                ),
              ),
            ],
          ),

          // COUNTER
          Container(
            width: size.width *.70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Counter(
                    icon: Icons.sentiment_very_dissatisfied,
                    title: "Cases",
                    numbers: "${country.cases}",
                    color: Colors.amberAccent),
                Counter(
                  icon: Icons.sentiment_dissatisfied,
                  title: "Deaths",
                  numbers: "${country.deaths}",
                  color: Colors.redAccent,
                ),
                Counter(
                  icon: Icons.sentiment_very_satisfied,
                  title: "Recovered",
                  numbers: "${country.recovered}",
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Title & Number
class MainCounter extends StatelessWidget {
  final String title;
  final String numbers;
  final color;

  const MainCounter({
    Key key,
    @required this.size,
    this.title,
    this.numbers,
    this.color,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: size.width *.30,
      height: 80,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            numbers,
            style: TextStyle(
                fontSize: 15, color: color, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize:12, color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final String title;
  final String numbers;
  final color;
  final icon;

  const Counter({Key key, this.title, this.numbers, this.color, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
            child: Icon( icon, color: color.withOpacity(0.8),),
          ),
          Text(
            numbers,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 10, color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

}