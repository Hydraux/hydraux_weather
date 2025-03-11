const String forecastAPIBaseURL = "https://api.open-meteo.com/v1";

// Test query params. TODO: Remove with user inputs feature
const double latitude = 43.775;
const double longitude = -88.4388;
const String current = "temperature_2m,relative_humidity_2m,is_day,precipitation,weather_code,cloud_cover,wind_speed_10m";
const String hourly = "temperature_2m,weather_code,precipitation_probability,precipitation,relative_humidity_2m";
const String daily = "temperature_2m_max,temperature_2m_min,precipitation_sum,precipitation_hours,precipitation_probability_max,weather_code";
const String temperature_unit = "fahrenheit";
const String wind_speed_unit = "mph";
const String precipitation_unit = "inch";
const String timezone = "America/Chicago";
const int forecast_days = 16;
const int forecast_hours = 24;