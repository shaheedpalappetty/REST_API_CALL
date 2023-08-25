class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;
  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.coordinates,
      required this.street,
      required this.timezone});
  factory UserLocation.fromMap(Map<String, dynamic> e) {
    final coordinates = LocationCoordinates.fromMap(e['coordinates']);
    final street = LocationStreet.fromMap(e['street']);
    final timezone = LocationTimezone.fromMap(e['timezone']);
    return UserLocation(
      city: e['city'],
      state: e['state'],
      country: e['country'],
      postcode: e['postcode'].toString(),
      coordinates: coordinates,
      street: street,
      timezone: timezone,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.name,
    required this.number,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> e) {
    return LocationStreet(
      name: e['name'],
      number: e['number'],
    );
  }
}

class LocationCoordinates {
  final String latitude;
  final String longitude;
  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });
  factory LocationCoordinates.fromMap(Map<String, dynamic> e) {
    return LocationCoordinates(
        latitude: e['latitude'], longitude: e['longitude']);
  }
}

class LocationTimezone {
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description,
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> e) {
    return LocationTimezone(offset: e['offset'], description: e['description']);
  }
}
