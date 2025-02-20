  import 'package:flutter/material.dart';

IconData getWeatherIcon({required double precipitationSum, required double minTemperature, required bool isFahrenheit, required int cloudCover}){
    if(precipitationSum != 0){
      if(isFahrenheit){
        if(minTemperature <= 32){
          return Icons.ac_unit;
        }
        return Icons.water_drop;
      } else {
        if(minTemperature <= 0){
          return Icons.ac_unit;
        }
        return Icons.water_drop;
      }
    }
    // TODO: handle cloud cover
    return Icons.sunny;
  }