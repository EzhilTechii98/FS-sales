class EmployeeListModel {
  final int id;
  final String employeeName;
  final String emailAddress;
  final String phoneNumber;
  final String team;
  final String designation;
  final String projectManager;
  final String industry;
  final String technology;

  EmployeeListModel({
    required this.id,
    required this.employeeName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.team,
    required this.designation,
    required this.projectManager,
    required this.industry,
    required this.technology,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'employeeName': employeeName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'team': team,
      'designation': designation,
      'projectManager': projectManager,
      'industry': industry,
      'technology': technology,

    };
  }
}