class EmployeeListModel {
  final int id;
  final String projectName;
  final String industry;
  final String technology;
  final String projectManager;
  final String clientName;
  final String clientEmail;
  final String clientPhoneNo;

  EmployeeListModel({
    required this.id,
    required this.projectName,
    required this.industry,
    required this.technology,
    required this.projectManager,
    required this.clientName,
    required this.clientEmail,
    required this.clientPhoneNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectName': projectName,
      'industry': industry,
      'technology': technology,
      'projectManager': projectManager,
      'clientName': clientName,
      'clientEmail': clientEmail,
      'clientPhoneNo': clientPhoneNo,

    };
  }
}