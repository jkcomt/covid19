import 'package:flutter/material.dart';
import 'package:ncovid_19/providers/covid19_provider.dart';
import 'package:ncovid_19/model/covid19_model.dart';

class HomePage extends StatelessWidget {
  final covid19provider = new Covid19Provider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracking"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: cases(),
      ),
    );
  }

  Widget cases() {
    return FutureBuilder(
      future: covid19provider.getCovid19Info(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final Covid19 covid19 = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 5.0,),
              itemList("Cases", covid19.cases),
              
              itemList("Suspected", covid19.suspected),
              
              itemList("Confirmed", covid19.confirmed),
              
              itemList("Deaths", covid19.deaths),
              
              itemList("Recovered", covid19.recovered),
              SizedBox(height: 25.0,),
            ],
          );
        } else {
          return Container(
              height: 100.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget itemList(key, value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white12,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal:10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(color: textColorCondition(key),fontSize: 25.0),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Icon(
                iconCondition(key),
                color: textColorCondition(key),
                size: 50.0,
              ),
              Expanded(child: Container()),
              Text(value, style: TextStyle(color: textColorCondition(key), fontSize: 25.0)),
            ],
          ),
          
        ],
      ),
    );
  }

  IconData iconCondition(String key){
    IconData icon = Icons.mood;
    switch (key) {
      case "Cases":
        icon = Icons.mood;
        break;
      case "Suspected":
        icon = Icons.sentiment_dissatisfied;
        break;
      case "Confirmed":
        icon = Icons.mood_bad;
        break;
      case "Deaths":
        icon = Icons.sentiment_very_dissatisfied;
        break;
      case "Recovered":
        icon = Icons.sentiment_very_satisfied;
        break;
      default:
        icon = Icons.mood;
        break;
    }
    return icon;
  }

  Color textColorCondition(String key) {
    Color color = Colors.white;
    switch (key) {
      case "Cases":
        color = Colors.yellow[200];
        break;
      case "Suspected":
        color = Colors.yellow;
        break;
      case "Confirmed":
        color = Colors.orange;
        break;
      case "Deaths":
        color = Colors.red;
        break;
      case "Recovered":
        color = Colors.green;
        break;
      default:
        color = Colors.white;
        break;
    }
    return color;
  }
}
