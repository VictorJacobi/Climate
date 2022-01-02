import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/city_screen.dart';

WeatherModel weatherMode = WeatherModel();

var  myOnlineData;
var myNewData;
double temperature;
String weatherDescription;
int condition;
String country, cityName,result;


class LocationScreen extends StatefulWidget {
  LocationScreen({this.myPassedData});
 final myPassedData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  dynamic getOnlineData() async{
    MyLocationData data = MyLocationData();
    var myOnlineData = await data.getOnlineDataByCityName(result);
    return(myOnlineData);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myNewData = widget.myPassedData;
    print(myNewData);
    updateUI(myNewData);
  }

  void updateUI(myNewData){
    setState(() {
      temperature = jsonDecode(myNewData)["main"]["temp"];
      cityName= jsonDecode(myNewData)["name"];
      country= jsonDecode(myNewData)["sys"]["country"];
      condition = jsonDecode(myNewData)["weather"][0]["id"];
      weatherDescription= jsonDecode(myNewData)["weather"][0]["description"];
      });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                        MyLocationData newLocation = MyLocationData();
                     myNewData = await newLocation.getOnlineDataByLatAndLong();
                     updateUI(myNewData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),

                  TextButton(
                    onPressed: () async{
                      result = await Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return CityScreen();
                        }
                      ),);

                      myOnlineData = await getOnlineData();
                      updateUI(myOnlineData);
                      print (result);
                      print(myOnlineData);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temperature.toInt().toString()+'°',//temperatureText+
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherMode.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    weatherMode.getMessage(temperature.toInt()).toString()+' in '+cityName+" "+'('+country+')',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
