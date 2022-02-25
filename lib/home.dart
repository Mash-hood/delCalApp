import 'package:flutter/material.dart';
import 'constants.dart';
import 'deliveryCalculator.dart';
import 'package:intl/intl.dart';
import 'package:deliveryFeeCalculator/widgets/textField.dart';
import 'package:deliveryFeeCalculator/widgets/textField2.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _delFee = "0.0";
  int cartValue;
  DateTime timeOfOrder;
  int dist;
  int numItem;
  String _date; // = "2022-10-10"
  String _time; //  = "15:00"
  DateTime tm; //  = DateTime.now()

  final controllerValue = TextEditingController();
  final controllerDist = TextEditingController();
  final controllerItem = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerTime = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    controllerValue.dispose();
    controllerDist.dispose();
    controllerItem.dispose();
    controllerDate.dispose();
    controllerTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cart Value',
                      style: kTextsStyle,
                    ),
                    const SizedBox(width: 60),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextFieldWidget(
                          label: 'Cart Value', cont: controllerValue),
                    ),
                    Text(
                      '  €',
                      style: kTextsStyle,
                    ),
                  ],
                ),
                myDivider(),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Delivery Distance',
                      style: kTextsStyle,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextFieldWidget(
                          label: 'Delivery Distance', cont: controllerDist),
                    ),
                    Text(
                      '  m',
                      style: kTextsStyle,
                    ),
                  ],
                ),
                myDivider(),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Amount of Items',
                      style: kTextsStyle,
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextFieldWidget(
                          label: "Number of Items", cont: controllerItem),
                    ),
                  ],
                ),
                myDivider(),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Date',
                      style: kTextsStyle,
                    ),
                    const SizedBox(width: 100),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextFieldWithPicker(
                          label: "Pick a date",
                          cont: controllerDate,
                          tapMethod: pickingDate,
                          icon: Icons.calendar_today),
                    ),
                  ],
                ),
                myDivider(),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Time',
                      style: kTextsStyle,
                    ),
                    const SizedBox(width: 100),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextFieldWithPicker(
                          label: "Pick a time",
                          cont: controllerTime,
                          tapMethod: pickingTime,
                          icon: Icons.timelapse),
                    ),
                  ],
                ),
                myDivider(),
                const SizedBox(height: 20.0),
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
                myDivider(),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Delivery Price: ', style: kPriceTextsStyle),
                    Text(' $_delFee', style: kPriceTextsStyle),
                    Text('  €', style: kPriceTextsStyle),
                  ],
                ),
                myDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider myDivider() => Divider(color: Colors.purple, thickness: 1.0);

  void _calcFee() {
    setState(() {
      if ((controllerValue.text.isEmpty) ||
          (controllerDist.text.isEmpty) ||
          (controllerItem.text.isEmpty) ||
          (controllerDate.text.isEmpty) ||
          (controllerTime.text.isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Please enter missing inputs'),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.deepOrange,
        ));
      } else {
        cartValue = int.parse(controllerValue.text);
        dist = int.parse(controllerDist.text);
        numItem = int.parse(controllerItem.text);
        timeOfOrder = DateTime.parse(_date + " " + _time);

        _delFee = deliveryFee(cartValue, dist, numItem, timeOfOrder).toString();
      }
    });
  }

  void pickingDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((date) {
      setState(() {
        _date = DateFormat('yyyy-MM-dd').format(date);
        controllerDate.text = _date;
      });
    });
  }

  void pickingTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      setState(() {
        tm = DateFormat.jm().parse(time.format(context));
        _time = DateFormat("HH:mm").format(tm);
        controllerTime.text = _time;
      });
    });
  }
}
