import 'package:flutter/material.dart';

const Color kTextFieldColor = Color(0xFFBBDEFB);
const kTextsStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

const kCartValueDecoration = InputDecoration(
  filled: true,
  fillColor: kTextFieldColor,
  hintText: 'Enter Cart Value',
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kDistanceDecoration = InputDecoration(
  filled: true,
  fillColor: kTextFieldColor,
  hintText: 'Enter Delivery Distance',
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kItemsDecoration = InputDecoration(
  filled: true,
  fillColor: kTextFieldColor,
  hintText: 'Enter Number of Items',
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kTimeDecoration = InputDecoration(
  filled: true,
  fillColor: kTextFieldColor,
  hintText: 'YYYYMMDD HHMMSS',
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
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
