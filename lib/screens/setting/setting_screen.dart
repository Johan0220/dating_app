import 'dart:ffi';
import 'dart:math';

import 'package:dating_app/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SettingScreen extends StatefulWidget{
  const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen>{
  double _currentValueDistance = 20;
  double _currentValueAgeMin = 18;
  double _currentValueAgeMax = 29;
  late RangeValues _currentRangeValues = RangeValues(_currentValueAgeMin, _currentValueAgeMax);
  late String _sex = "Women";
  late String _interests = "Locking for, add langues, zodiac, education";

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Discovery Setting'),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 1,
          shadowColor: Colors.grey,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.arrow_left),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Maximum Distance",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text("${_currentValueDistance.toInt()}km.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,)
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Slider(
                              value: _currentValueDistance.roundToDouble(),
                              min: 1,
                              max: 50,
                              inactiveColor: Colors.grey,
                              onChanged: (double value) => {
                                setState(() {
                                  _currentValueDistance = value.roundToDouble();
                                }),
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: InkWell(
                    onTap: ()=>PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: HomeScreen()),
                    splashColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Show me",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${_sex}",
                                    style: TextStyle(),
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Age Range",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text("${_currentValueAgeMin.toInt()} - ${_currentValueAgeMax.toInt()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,)
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          RangeSlider(
                              values: _currentRangeValues,
                              min: 18,
                              max: 99,
                              inactiveColor: Colors.grey,
                              onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                    _currentValueAgeMin = values.start;
                                    _currentValueAgeMax = values.end;
                                  });
                              }
                            ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          )
        ),
    );
  }
}