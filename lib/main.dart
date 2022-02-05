import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'deliveryCalculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery Fee App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Delivery Fee Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _delFee = 0;
  int cartValue;
  DateTime timeOfOrder;
  int dist;
  int numItem;

  final controllerValue = TextEditingController();
  final controllerDist = TextEditingController();
  final controllerItem = TextEditingController();

  void _calcFee() {
    setState(() {
      cartValue = int.parse(controllerValue.text);
      dist = int.parse(controllerDist.text);
      numItem = int.parse(controllerItem.text);
      _delFee = deliveryFee(cartValue, dist, numItem, timeOfOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cart Value              ',
                      style: kTextsStyle,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: buildTextField('Cart Value', controllerValue),
                    ),
                    Text(
                      '  €',
                      style: kTextsStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Delivery Distance  ',
                      style: kTextsStyle,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child:
                          buildTextField('Delivery Distance', controllerDist),
                    ),
                    Text(
                      '  m',
                      style: kTextsStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Amount of Items   ',
                      style: kTextsStyle,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: buildTextField('Number of Items', controllerItem),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Date & Time           ',
                      style: kTextsStyle,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: kTimeDecoration,
                        onChanged: (value) {
                          timeOfOrder = DateTime.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: _calcFee,
                      tooltip: 'Calculate delivery fee',
                      label: const Text('Calculate Delivery Price'),
                      extendedTextStyle: kPriceTextsStyle,
                      backgroundColor: Colors.deepPurple,
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Delivery Price: ', style: kPriceTextsStyle),
                    Text(' $_delFee', style: kPriceTextsStyle),
                    Text('  €', style: kPriceTextsStyle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, TextEditingController cont) => TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        controller: cont,
      );
}
