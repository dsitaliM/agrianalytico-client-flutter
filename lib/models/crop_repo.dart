import 'package:agri_analytico_flutter/models/crop.dart';

Crop maize = new Crop()
  ..name = 'Maize'
  ..image = 'maize.jpg'
  ..phRange = '5.5 - 7.5'
  ..rootDepth = '3.0 - 4.0'
  ..madValue = '50'
  ..summaryText = 'This is a summary';

Crop tomato = new Crop()
  ..name = 'Tomato'
  ..image = 'tomato2.jpg'
  ..phRange = '5.1 - 7.6'
  ..rootDepth = '3.0'
  ..madValue = '64'
  ..summaryText = 'This is a summary';

Crop tobacco = new Crop()
  ..name = 'Tobacco'
  ..image = 'tobacco2.jpg'
  ..phRange = '6.0 - 7.1'
  ..rootDepth = '3.0 - 4.0'
  ..madValue = '40'
  ..summaryText = 'This is a summary';

Crop cotton = new Crop()
  ..name = 'Cotton'
  ..image = 'cotton.jpg'
  ..phRange = '5.0 - 6.0'
  ..rootDepth = '3.3 - 5.6'
  ..madValue = '50'
  ..summaryText = 'This is a summary';

Crop sugarcane = new Crop()
  ..name = 'Sugarcane'
  ..image = 'sugarcane.jpg'
  ..phRange = '6.0 - 8.0'
  ..rootDepth = '4.0 - 5.0'
  ..madValue = '50'
  ..summaryText = 'This is a summary';

Crop soybeans = new Crop()
  ..name = 'Soybeans'
  ..image = 'soybean4.jpg'
  ..phRange = '6.8 - 5.6'
  ..rootDepth = '2.0 - 3.0'
  ..madValue = '25'
  ..summaryText = 'This is a summary';

List<Crop> cropsList = [maize, tomato, tobacco, cotton, sugarcane, soybeans];
