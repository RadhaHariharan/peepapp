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
  String whatIDo;
  int code;
  String gender;
  String worksAt;
  String status;
  String img;
  String email;
  List<String> intrests;

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
    required this.code,
    required this.email,
    required this.gender,
    required this.img,
    required this.intrests,
    required this.status,
    required this.whatIDo,
    required this.worksAt,
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
        code: data['code'] ?? 91,
        email: data['email'] ?? "test@gmail.com",
        gender: data['gender'] ?? 'Male',
        img: data['img'] ?? "",
        intrests: data['intrests'] ?? ["Chess", "Movies"],
        status: data['status'] ?? 'Married',
        whatIDo: data['whatIDo'] ?? "Software Developer",
        worksAt: data['worksAt'] ?? "ABC Company",
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
