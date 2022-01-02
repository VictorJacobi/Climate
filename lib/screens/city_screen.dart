import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/Re_use_form.dart';

String inputVal;

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    MyCreatedForm(myIcon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),initializedText: 'Enter City name',
                    onChanged: (value){
                      inputVal = (value);
                    },),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context,inputVal);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

