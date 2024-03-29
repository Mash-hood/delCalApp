import 'dart:math';

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

// function for the calculation of delivery fee based on distance
int calcDistFee(int dist) {
  int distFee = 0;
  if (dist <= kBaseDistance) {
    distFee = kBaseDistanceCharge;
  } else if (dist > kBaseDistance) {
    distFee =
        kBaseDistanceCharge + ((dist - kBaseDistance) / kExtraDistance).ceil();
  }
  return distFee;
}

// function for the calculation of surcharges based on the number of items
double calcItemSurcharge(int itemsNum) {
  double itemSurcharge = 0.0;
  if (itemsNum <= kBaseItem) {
    itemSurcharge = 0.0;
  } else if (itemsNum > kBaseItem) {
    itemSurcharge = (itemsNum - kBaseItem) * 0.5;
  }
  return itemSurcharge;
}

// function for calculating surcharges based on the value of cart
int calcValueSurcharge(int value) {
  int valueSurcharge = 0;
  if (value <= kNormalDeliveryFeeLimit) {
    valueSurcharge = (kNormalDeliveryFeeLimit - value);
  }
  return valueSurcharge;
}

// function for calculating Delivery Fee; surcharges inclusive
double deliveryFee(int cartValue, int deliveryDistance, int numberOfItems,
    DateTime timeOfOrder) {
  double deliveryFee;

  // Delivery fee calculation
  if (cartValue >= kNoneDeliveryFeeLimit) {
    return deliveryFee = 0; // cartValue is greater than 100 €
  } else {
    // calculate delivery fee, normally, otherwise
    deliveryFee = calcDistFee(deliveryDistance) +
        calcItemSurcharge(numberOfItems) +
        calcValueSurcharge(cartValue);
  }

  // adjusting the delivery fee for the rush hour
  if ((timeOfOrder.weekday == DateTime.friday) &&
      (rushHourStart <= timeOfOrder.hour) &&
      (timeOfOrder.hour <= rushHourEnd)) {
    deliveryFee = rushHourGain * deliveryFee;
  }

  // finally, checking that delivery fee is not above the maximum value
  return min(kMaxDeliveryFee, deliveryFee);
}
