class DeliveryAddress {
  String district;
  String cityName;
  int regionId;
  String regionName;
  int countryId;
  String countryName;
  String countryCode;
  String currencyCode;
  String countryIsoCode;
  double latitude;
  double longitude;
  String address;

  DeliveryAddress({
    required this.district,
    required this.cityName,
    required this.regionId,
    required this.regionName,
    required this.countryId,
    required this.countryName,
    required this.countryCode,
    required this.currencyCode,
    required this.countryIsoCode,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) {
    return DeliveryAddress(
      district: json['district'] ?? '',
      cityName: json['city_name'] ?? '',
      regionId: json['region_id'] ?? 0,
      regionName: json['region_name'] ?? '',
      countryId: json['country_id'] ?? 0,
      countryName: json['country_name'] ?? '',
      countryCode: json['country_code'] ?? '',
      currencyCode: json['currency_code'] ?? '',
      countryIsoCode: json['country_iso_code'] ?? '',
      latitude: (json['latitude']!= null) ? double.parse(json['latitude'].toString()) : 0.0, // double.parse(json
      longitude: (json['longitude']!= null) ? double.parse(json['longitude'].toString()) : 0.0, // double.parse(json
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'district': district,
      'city_name': cityName,
      'region_id': regionId,
      'region_name': regionName,
      'country_id': countryId,
      'country_name': countryName,
      'country_code': countryCode,
      'currency_code': currencyCode,
      'country_iso_code': countryIsoCode,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }
}
