import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var fruitIndex = 0;
  String dropdownValue = 'Red';
  String selectedColor = '';
  var fruit = ['strawberry','banana','orange','grape'];
  var color = ['Red','Yellow','Orange','Purple'];

  //initialize fruit index based on selected colour
  void validateFruit() {
    setState(() {
      selectedColor = dropdownValue;
      if(selectedColor == 'Red')
        fruitIndex = 0;
      else if(selectedColor == 'Yellow')
        fruitIndex = 1;
      else if(selectedColor == 'Orange')
        fruitIndex = 2;
      else  
        fruitIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Display fruit based on colour'),
        ),
        body: Center(
          child : Column(
          children: [
              Container( 
                child: Text('Choose the colour of fruit', style: TextStyle(fontSize: 15),),
                margin: EdgeInsets.only(top: 20, bottom: 20),
              ), 
              
              Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 

              Container(
              margin: EdgeInsets.only(right: 10),
              child:  
              DropdownButton(
                value: dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                //iconSize: 
                //elevation: 
                //style: 
      
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: color.map((String items){
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items)
                  );
                }).toList(),
              ),),
              
              RaisedButton(
                child: Text('Select'),
                onPressed: validateFruit,
                color: Colors.blue,
                textColor: Colors.white,
              ),
              ]),

              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child :
                //Print Fruit on Text Widget 
                Text(selectedColor == ''
                ? 'The fruit is '
                : 'The fruit is ' + fruit[fruitIndex], 
                  style: TextStyle(fontSize: 15,)
                )
              ),

              
            ]),
        ),
      ),
    );
  }
}
