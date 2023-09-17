import 'package:flutter/material.dart';

void main(){
  runApp(flutterapp());
}
class flutterapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue

      ),
      home:dashboardscreen(),
    );
  }
}

class dashboardscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Calculator'),
      ),
      body: Container(
        color: Colors.blueAccent.shade100,
        child: Calculation(),
      ),

    );
  }
}

class Calculation extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CalculationState();
  }
}

class CalculationState extends State<Calculation>{
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();

  var Result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              color: Colors.grey,
              child: TextField(
                controller: no1Controller,
                keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: "  Enter 1st Number",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 3,
                  )
              ),
              ),
              ),
            ),
            Container(
              width: 400,
              color: Colors.grey,
              child: TextField(
                controller: no2Controller,
              keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "  Enter 2st Number",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 3,
                      )
                  ),
                ),),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Result = Operation(no1Controller,no2Controller,1);
                  setState(() {

                  });
                }, child: Text("Add(+)")),

                ElevatedButton(onPressed: (){
                  Result = Operation(no1Controller,no2Controller,2);
                  setState(() {

                  });
                }, child: Text("Sub(-)")),

                ElevatedButton(onPressed: (){
                  Result = Operation(no1Controller,no2Controller,3);
                  setState(() {

                  });
                }, child: Text("Mul(x)")),

                ElevatedButton(onPressed: (){
                  Result = Operation(no1Controller,no2Controller,4);
                  setState(() {

                  });
                }, child: Text("Div(/)")),

              ],
            ),

              SizedBox(height: 25,),

            Text(Result,style: TextStyle(fontSize: 25,color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}

String Operation(var no1Controller,var no2Controller, var decide)
{
  var Result = "";
  var Res;
  
  var no1 = int.parse(no1Controller.text.toString());
  var no2 = int.parse(no2Controller.text.toString());

  if(decide == 1){
    Res = no1 + no2 ;
    Result = "Addition of $no1 and $no2 is $Res ";
  }
  else if (decide == 2){
    Res = no1 - no2;
    Result = "Subtraction of $no1 and $no2 is $Res ";
  }
  else if (decide == 3){
    Res = no1 * no2;
    Result = "Multiplication of $no1 and $no2 is $Res ";
  }
  else if(decide == 4){
    Res = no1/no2;
    Result = "Division of $no1 and $no2 is $Res ";
  }
  else
    Result = "Invalid Input Or Error";

  return Result;
}