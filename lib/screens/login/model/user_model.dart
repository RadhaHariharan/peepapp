class UserDataModel {
  String id;
  String userId;
  String name;
  String phone;
  String createdAt;
  String updatedAt;
  LocationModel location;
  bool newUser;
  String token;

  UserDataModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
    required this.newUser,
    required this.token,
  });

  static fromMap(Map<String, dynamic> data) => UserDataModel(
        id: data['id'],
        createdAt: data['createdAt'],
        name: data['name'],
        phone: data['phone'],
        newUser: data['new'],
        token: "",
        updatedAt: data['updatedAt'],
        userId: data['userId'],
        location: LocationModel(
          lat: data['location']['lat'],
          lng: data['location']['lng'],
          updatedAt: data['location']['updatedAt'],
        ),
      );
}

class LocationModel {
  double lat;
  double lng;
  String updatedAt;

  LocationModel({
    required this.lat,
    required this.lng,
    required this.updatedAt,
  });
}
