import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bmi App',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightControler= TextEditingController();
  var fitControler= TextEditingController();
  var inchControler= TextEditingController();

  var result="";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Bmi App"),
        ),
      ),
      body: Center(
        child: Container(
          width: width*0.90,
          child: Column(
            children: [
              SizedBox(
                height: height*0.05,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter your weight",
                  prefixIcon: Icon(Icons.line_weight),
                  suffix: Text('Kg'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                keyboardType: TextInputType.number,
                controller: weightControler,
              ),
              SizedBox(
                height: height*0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter your height",
                  suffix: Text('Fit'),
                  prefixIcon: Icon(Icons.height),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
                ),
                keyboardType: TextInputType.number,
                controller: fitControler,
              ),
              SizedBox(
                height: height*0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter your height",
                  suffix: Text('Inch'),
                  prefixIcon: Icon(Icons.height),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: inchControler,
              ),
              SizedBox(
                height: height*0.04,
              ),
              ElevatedButton(
                  onPressed: (){
                    var wt= weightControler.text.toString();
                    var ft= fitControler.text.toString();
                    var inc= inchControler.text.toString();

                    if(wt!=""&&ft!=""&&inc!=""){
                      var iwt=int.parse(wt);
                      var ift=int.parse(ft);
                      var iinc= int.parse(inc);

                      var tInch= ift*12 +iinc;
                      var tCm= tInch*2.54;
                      var tM= tCm/100;

                      var bmi=iwt/(tM*tM);

                      setState(() {
                        result="Your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    }
                    else{
                      setState(() {
                        result="Please give all input";
                      });
                    }
                  },
                  child: Text("Calculate Bmi"),
              ),
              SizedBox(
                height: height*0.04,
              ),
              Container(
                  child: Text(result,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

