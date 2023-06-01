import 'package:flutter/material.dart';

//////////////////////////////////////////////////
double getHeightInPercent(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height) * (percent / 100);
}

////////////////////////////////////////////////////////////////
double getWidthInPercent(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width) * (percent / 100);
}

////////////////////////////////////////////////////////////////
double getSp(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width) * (percent / 300);
}
