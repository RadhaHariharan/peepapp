class PeopleModel {
  String img;
  String name;
  String whatIDo;
  double distance;
  String location;
  String workAt;
  String status;
  String intrests;
  String id;
  String userId;

  PeopleModel(
      {this.img = '',
      required this.name,
      this.whatIDo = 'Staff Engineer',
      this.distance = 0.1,
      this.location = 'Hyderabad',
      this.workAt = 'VComply',
      this.status = 'Active',
      this.intrests = 'Development',
      required this.id,
      required this.userId});

  static fromMap(Map<String, dynamic> data) => PeopleModel(
        id: data['id'],
        name: data['name'] ?? "",
        userId: data['userId'],
      );
}
