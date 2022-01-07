import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  double _heightSlider = 100;
  double _weightSlider = 60;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:AppBar(title:Text("BMI Calculator")),
        body:SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize:32),),
                SizedBox(height: 8,),
                Image.network("https://i.natgeofe.com/k/7bfcf2d2-542e-44f0-962a-c36f2efa98a5/heart.jpg", width: 150,),
                SizedBox(height: 8,),
                Text("We care about your health"),
                SizedBox(height: 8,),
                Text("Height (${_heightSlider.round().toString()} cm)", style: TextStyle(fontSize: 20),),
                SizedBox(height: 8,),
                Slider(
                  value: _heightSlider,
                  max: 200,
                  label: _heightSlider.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _heightSlider = value;
                    });
                  },
                ),
                SizedBox(height:8),
                Text("Weight (${_weightSlider.round().toString()} kg)", style: TextStyle(fontSize: 20)),
                SizedBox(height: 8,),
                Slider(
                  value: _weightSlider,
                  max: 160,
                  label: _weightSlider.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _weightSlider = value;
                    });
                  },
                ),
                SizedBox(height: 8,),
                TextButton.icon(onPressed: (){
                  var bmi = _weightSlider.round() / pow(_heightSlider.round()/100,2);
                  print(bmi);

                }, icon: Icon(Icons.favorite), label: Text("Calculate"))
              ],
            ),
          ),
        )
    );
  }
}
