import 'dart:math';
import 'constants.dart';

enum DeliveryFeeType { none, normal }

// function for the determination of DeliveryFee case
int getDeliveryFeeType(int value) {
  int tmp;
  if (value >= kNoneDeliveryFeeLimit) {
    tmp = 0;
  } else {
    tmp = 1;
  }
  return tmp;
}

// function for calculating normal  delivery fee case
double calcFee(int value, int dist, int itemsNum, DateTime dateOfPurchase) {
  // constants and variables definition
  double tmpFee = 0.0;
  int tmpFeeDist = 0;
  double tmpFeeItem = 0.0;
  int tmpFeeValue = 0;

  // calculation of delivery fee based on distance
  if (dist <= kBaseDistance) {
    tmpFeeDist = kBaseDistanceCharge;
  } else if (dist > kBaseDistance) {
    tmpFeeDist =
        kBaseDistanceCharge + ((dist - kBaseDistance) / kExtraDistance).ceil();
  }

  // calculation of surcharges based on the number of items
  if (itemsNum <= kBaseItem) {
    tmpFeeItem = 0.0;
  } else if (itemsNum > kBaseItem) {
    tmpFeeItem = (itemsNum - kBaseItem) * 0.5;
  }

  // calculation of surcharges based on the value of cart
  if (value <= kNormalDeliveryFeeLimit) {
    tmpFeeValue = (kNormalDeliveryFeeLimit - value);
  }

  // summing of surcharges to deliveryFee charge
  tmpFee = tmpFeeDist + tmpFeeItem + tmpFeeValue;

  // adjusting the delivery fee for the rush hour
  if ((dateOfPurchase.weekday == DateTime.friday) &&
      (15 <= dateOfPurchase.hour) &&
      (dateOfPurchase.hour <= 19)) {
    tmpFee = 1.1 * tmpFee;
  }
  return tmpFee;
}

// function for calculating Delivery Fee based
double deliveryFee(int cartValue, int deliveryDistance, int numberOfItems,
    DateTime timeOfOrder) {
  // temporary variables definition
  double tmpDeliveryFee;

  switch (DeliveryFeeType.values[getDeliveryFeeType(cartValue)]) {
    case DeliveryFeeType.none:
      tmpDeliveryFee = 0.0;
      break;
    case DeliveryFeeType.normal:
      continue normalCase;
    normalCase:
    default: // Fall through from case normal
      tmpDeliveryFee =
          calcFee(cartValue, deliveryDistance, numberOfItems, timeOfOrder);
  }
  return min(kMaxDeliveryFee, tmpDeliveryFee);
}
