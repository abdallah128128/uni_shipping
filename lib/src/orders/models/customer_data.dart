class CustomerData {
  String name;
  String email;
  String mobile;

  CustomerData({
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobile': mobile,
    };
  }
}
