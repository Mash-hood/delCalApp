import 'package:flutter/material.dart';

const Color kTextFieldColor = Color(0xFFBBDEFB);
const kTextsStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
const kPriceTextsStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

const kTimeDecoration = InputDecoration(
  hintText: 'yyyy-mm-dd hh:mm:ss',
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

// constants and variables definition
const int kBaseDistance = 1000;
const int kExtraDistance = 500;
const int kBaseDistanceCharge = 2;
const int kBaseItem = 4;
const int kNoneDeliveryFeeLimit = 100;
const int kNormalDeliveryFeeLimit = 10;
const double kMaxDeliveryFee = 15.0;
const int rushHourStart = 15;
const int rushHourEnd = 19;
const double rushHourGain = 1.1;
