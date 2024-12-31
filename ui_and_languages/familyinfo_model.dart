
class FamilyinfoModel {
  final int family_data_collected;
  final double family_members_count;
  final double member_serial_no;
  final String relationship;
  final String family_with_parents_info;
  final String full_name;
  final String gender;
  final String marital_status;
  final String dob;
  final double age;
  final double mobile_no;
  final double id_card_no;
  final String id_front_photo;
  final String id_back_photo;
  final String member_photo;

  FamilyinfoModel({
    this.family_data_collected,
    this.family_members_count,
    this.member_serial_no,
    this.relationship,
    this.family_with_parents_info,
    this.full_name,
    this.gender,
    this.marital_status,
    this.dob,
    this.age,
    this.mobile_no,
    this.id_card_no,
    this.id_front_photo,
    this.id_back_photo,
    this.member_photo,
  });

  factory FamilyinfoModel.fromJson(Map<String, dynamic> json) {
    return FamilyinfoModel(
      family_data_collected: json['family_data_collected'],;
      family_members_count: json['family_members_count'],;
      member_serial_no: json['member_serial_no'],;
      relationship: json['relationship'],;
      family_with_parents_info: json['family_with_parents_info'],;
      full_name: json['full_name'],;
      gender: json['gender'],;
      marital_status: json['marital_status'],;
      dob: json['dob'],;
      age: json['age'],;
      mobile_no: json['mobile_no'],;
      id_card_no: json['id_card_no'],;
      id_front_photo: json['id_front_photo'],;
      id_back_photo: json['id_back_photo'],;
      member_photo: json['member_photo'],;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family_data_collected': family_data_collected,
      'family_members_count': family_members_count,
      'member_serial_no': member_serial_no,
      'relationship': relationship,
      'family_with_parents_info': family_with_parents_info,
      'full_name': full_name,
      'gender': gender,
      'marital_status': marital_status,
      'dob': dob,
      'age': age,
      'mobile_no': mobile_no,
      'id_card_no': id_card_no,
      'id_front_photo': id_front_photo,
      'id_back_photo': id_back_photo,
      'member_photo': member_photo,
    };
  }

  @override
  String toString() {
    return 'FamilyinfoModel(family_data_collected: ${family_data_collected}, family_members_count: ${family_members_count}, member_serial_no: ${member_serial_no}, relationship: ${relationship}, family_with_parents_info: ${family_with_parents_info}, full_name: ${full_name}, gender: ${gender}, marital_status: ${marital_status}, dob: ${dob}, age: ${age}, mobile_no: ${mobile_no}, id_card_no: ${id_card_no}, id_front_photo: ${id_front_photo}, id_back_photo: ${id_back_photo}, member_photo: ${member_photo})';
  }
}
