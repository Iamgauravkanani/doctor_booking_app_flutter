class Users {
  List<UserData>? users;
  String? error;
  String? message;

  Users({this.users, this.error, this.message});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      users = <UserData>[];
      json['data'].forEach((v) {
        users!.add(UserData.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['data'] = users?.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class UserData {
  String? patientLoginId;
  String? firstname;
  String? lastname;
  String? mobile;
  String? username;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? active;
  String? userIp;
  String? macAddress;
  String? expDate;
  String? resetLinkToken;
  String? usertype;
  String? oauthProvider;
  String? gender;
  String? picture;
  String? doctorId;
  String? countryId;
  String? stateId;
  String? cityId;
  String? offline;
  String? clinicName;
  String? clinicUrl;
  String? clinicActivation;

  UserData(
      {this.patientLoginId,
      this.firstname,
      this.lastname,
      this.mobile,
      this.username,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.active,
      this.userIp,
      this.macAddress,
      this.expDate,
      this.resetLinkToken,
      this.usertype,
      this.oauthProvider,
      this.gender,
      this.picture,
      this.doctorId,
      this.countryId,
      this.stateId,
      this.cityId,
      this.offline,
      this.clinicName,
      this.clinicUrl,
      this.clinicActivation});

  UserData.fromJson(Map<String, dynamic> json) {
    patientLoginId = json['patient_login_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    userIp = json['user_ip'];
    macAddress = json['mac_address'];
    expDate = json['exp_date'];
    resetLinkToken = json['reset_link_token'];
    usertype = json['usertype'];
    oauthProvider = json['oauth_provider'];
    gender = json['gender'];
    picture = json['picture'];
    doctorId = json['doctor_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    offline = json['offline'];
    clinicName = json['clinic_name'];
    clinicUrl = json['clinic_url'];
    clinicActivation = json['clinic_activation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_login_id'] = patientLoginId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['mobile'] = mobile;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['active'] = active;
    data['user_ip'] = userIp;
    data['mac_address'] = macAddress;
    data['exp_date'] = expDate;
    data['reset_link_token'] = resetLinkToken;
    data['usertype'] = usertype;
    data['oauth_provider'] = oauthProvider;
    data['gender'] = gender;
    data['picture'] = picture;
    data['doctor_id'] = doctorId;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['offline'] = offline;
    data['clinic_name'] = clinicName;
    data['clinic_url'] = clinicUrl;
    data['clinic_activation'] = clinicActivation;
    return data;
  }
}
