import 'dart:ui';

class AppConstant {
  static const bool applyMockMappings = true;
  static const String mockMappingFile = "assets/mocks/_mappings.json";
  static const String configFlavorsFile = "assets/config/flavors.json";

  static const int envProd = 1;
  static const int envStage = 2;
  static const int envDev = 3;

  static const serviceEnvironment = envDev;
  static const String prodServiceBaseUrl =
      "https://www.gotoliquorstore.com/api/";
  static const String stageServiceBaseUrl =
      "https://www.gotoliquorshop.com/api/";
  static const String devServiceBaseUrl = "http://www.devglsstore.com/api/";

  static const String flavorProd = "prod";
  static const bool isShowTabScreens = true;

  static const int driverType = DriverType.pickUp;
}

//Spacing_
class Spacing {
  static const double extraSmallSpacing = 2;
  static const double smallSpacing = 5;
  static const double mediumSpacing = 8;
  static const double normalSpacing = 10;
  static const double largeSpacing = 15;
  static const double extraLargeSpacing = 20;
  static const double veryExtraLargeSpacing = 25;
  static const double tooExtraLargeSpacing = 30;
}

//padding
const double normalPadding = 16;

class FontName {
  static const String roboto = "Roboto";
  static const String gotham = "Gotham";
  static const String poppins = "Poppins";
}

class FontWeightSize {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
}

//orderType
class OrderType {
  static const int currentDeliveries = 1;
  static const int assignedDeliveries = 2;
  static const int pickedUp = 3;
  static const int readyToPickedUp = 4;
}

//orderStatus
class OrderStatusType {
  static const int rejected = 5;
}

class TabIndex {
  static const int readyTabIndex = 0;
  static const int pickedIndex = 1;
  static const int assignedTabIndex = 2;
  static const int deliveryTabIndex = 3;
  static const int settingsTabIndex = 4;
}

class ImageType {
  static const String logo = "LOGO";
  static const String banner = "BANNER";
}
class ColorSelectionType {
  static const String background = "BACKGROUND";
  static const String text = "TEXT";
}

class ActionType {
  static const int call = 1;
  static const int email = 2;
  static const int directions = 3;
}

class DriverType {
  static const int pickUp = 1;
  static const int dilevery = 2;
}
