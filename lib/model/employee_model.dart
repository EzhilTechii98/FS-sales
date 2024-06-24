class Employee {
  String username;
  String email;
  String designation;
  String phonenumber;
  String team;
  String reportingManager;
  String industry;
  String technology;
  String employeeId;

  Employee({
    required this.username,
    required this.email,
    required this.designation,
    required this.phonenumber,
    required this.team,
    required this.reportingManager,
    required this.industry,
    required this.technology,
    required this.employeeId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      username: json['Username'] ?? '',
      email: json['Email'] ?? '',
      designation: json['Designation'] ?? '',
      phonenumber: json['phonenumber'] ?? '',
      team: json['Team'] ?? '',
      reportingManager: json['ReportingManager'] ?? '',
      industry: json['Industry'] ?? '',
      technology: json['Technology'] ?? '',
      employeeId: json['employeeId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Email': email,
      'Designation': designation,
      'phonenumber': phonenumber,
      'Team': team,
      'ReportingManager': reportingManager,
      'Industry': industry,
      'Technology': technology,
      'employeeId': employeeId,
    };
  }
}