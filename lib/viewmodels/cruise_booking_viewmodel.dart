import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
        'Cruise past historic temples, timber hubs, and traditional waterfront '
        'settlements while experiencing authentic Sarawakian hospitality.',
    imagePath: 'assets/images/sibu_esplanade.jpg',
    imageCaption: 'Sibu Esplanade Landmark',
    initialRating: 43,
    packages: [
      'Private River Cruise',
      'Sunset Cruise',
      'Sunrise Cruise',
      'Rural Cruise',
      'SMI Park Cruise',
    ],
  );

  late int _starCount;
  bool _isStarred = false;
  DateTime _selectedDate = DateTime(2026, 11, 15);
  late String _selectedPackage;
  bool _isDarkMode = false;

  CruiseBookingViewModel() {
    _starCount = destination.initialRating;
    _selectedPackage = destination.packages.first;
  }

  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  String get formattedDate =>
      '${_selectedDate.day.toString().padLeft(2, '0')}/'
          '${_selectedDate.month.toString().padLeft(2, '0')}/'
          '${_selectedDate.year}';

  void toggleStar() {
    _isStarred = !_isStarred;
    _starCount += _isStarred ? 1 : -1;
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String? newPackage) {
    if (newPackage != null && newPackage != _selectedPackage) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}