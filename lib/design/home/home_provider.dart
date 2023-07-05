import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<Map<String, dynamic>> list = [
    {
      'head': 'Care Hospital and Research',
      'place': 'Hospital',
      'location': 'Post Box No 5685. Abdullah Street,Dubai',
      'country': 'UNITED ARAB EMIRATES',
      'distance': '8527.83 km'
    },
    {
      'head': 'Non Network Provider',
      'place': 'Hospital',
      'location': 'Non-Network Provider global',
      'country': 'United Arab Emirates',
      'distance': '8659.89 Km'
    },
    {
      'head': 'Dummy Provider',
      'place': 'Hospital',
      'location': 'UK',
      'country': 'United Kingdom',
      'distance': '8698.68 Km'
    },
    {
      'head': 'Zeiss Vision',
      'place': 'Hospital',
      'location': 'Non-Network Provider global',
      'country': 'United Arab Emirates',
      'distance': '8659.89 Km'
    },
  ];

  bool enable = false;
  refresh(){
    notifyListeners();
  }
}
