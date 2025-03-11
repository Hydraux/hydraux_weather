import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

IconData getWeatherIcon(int wmoCode) {
  switch (wmoCode) {
    // Clear conditions
    case 0:
      return TablerIcons.sun;
    case 1:
      return TablerIcons.sun_high;
    case 2:
      return TablerIcons.cloud;
    case 3:
      return TablerIcons.cloud;
    
    // Fog and depositing phenomena
    case 45:
      return TablerIcons.mist;
    case 48:
      return TablerIcons.mist;
    
    // Drizzle
    case 51:
      return TablerIcons.cloud_rain;
    case 53:
      return TablerIcons.cloud_rain;
    case 55:
      return TablerIcons.cloud_rain;
    case 56:
      return TablerIcons.snowflake;
    case 57:
      return TablerIcons.snowflake;
    
    // Rain
    case 61:
      return TablerIcons.cloud_rain;
    case 63:
      return TablerIcons.cloud_rain;
    case 65:
      return TablerIcons.cloud_storm;
    case 66:
      return TablerIcons.snowflake;
    case 67:
      return TablerIcons.snowflake;
    
    // Snow
    case 71:
      return TablerIcons.snowflake;
    case 73:
      return TablerIcons.snowflake;
    case 75:
      return TablerIcons.snowflake;
    case 77:
      return TablerIcons.grain;
    
    // Rain showers
    case 80:
      return TablerIcons.cloud_rain;
    case 81:
      return TablerIcons.cloud_rain;
    case 82:
      return TablerIcons.cloud_storm;
    
    // Snow showers
    case 85:
      return TablerIcons.cloud_snow;
    case 86:
      return TablerIcons.snowflake;
    
    // Thunderstorm
    case 95:
      return TablerIcons.cloud_storm;
    case 96:
      return TablerIcons.cloud_storm;
    case 99:
      return TablerIcons.cloud_storm;
    
    default:
      return TablerIcons.question_mark;
  }
}

String getWeatherStatus(int wmoCode) {
  switch (wmoCode) {
    // Clear conditions
    case 0:
    case 1:
      return "Sunny";
    case 2:
    case 3:
      return "Cloudy";
    
    // Fog and depositing phenomena
    case 45:
    case 48:
      return "Foggy";
    
    // Drizzle
    case 51:
    case 53:
    case 55:
      return "Rainy";
    case 56:
    case 57:
      return "Snowy";
    
    // Rain
    case 61:
    case 63:
      return "Rainy";
    case 65:
      return "Storming";
    case 66:
    case 67:
      return "Snowy";
    
    // Snow
    case 71:
    case 73:
    case 75:
    case 77:
      return "Snowy";
    
    // Rain showers
    case 80:
    case 81:
      return "Rainy";
    case 82:
      return "Storming";
    
    // Snow showers
    case 85:
    case 86:
      return "Snowy";
    
    // Thunderstorm
    case 95:
    case 96:
    case 99:
      return "Storming";
    
    default:
      return "Unknown";
  }
}