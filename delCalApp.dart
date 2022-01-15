import 'dart:io';
import 'calcBrain.dart';

void main() {
  print("Enter cart value in euros");
  int n1 = int.parse(stdin.readLineSync());

  print("Enter delivery distance in meters");
  int n2 = int.parse(stdin.readLineSync());

  print("Enter the amount of items");
  int n3 = int.parse(stdin.readLineSync());

  print("Enter delivery date and time in the format YYYYMMDD HHMMSS");
  DateTime n4 = DateTime.parse(stdin.readLineSync());

  // Calculate delivery fee
  double fee = deliveryFee(n1, n2, n3, n4);
  print("Delivery Fee is $fee");
}
