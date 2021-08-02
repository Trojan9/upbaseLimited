class Profiledata {
  String id;
  String role_id;
  String firstname;
  String lastname;
  String phone;
  String dp;
  String password;
  String preferredlang;
  String address;
  String occupation;
  String pregnancyweeks;
  String guardianphonenumber;
  String age;
  String created_at;
  String updated_at;
  String date_of_birth;
  String lga;
  String state;
  String country;
  Profiledata(
      {this.country,
      this.id,
      this.dp,
      this.firstname,
      this.lastname,
      this.address,
      this.lga,
      this.password,
      this.phone,
      this.state,
      this.date_of_birth,
      this.age,
      this.role_id,
      this.guardianphonenumber,
      this.preferredlang,
      this.pregnancyweeks,
      this.created_at,
      this.updated_at,
      this.occupation});
//  factory designretrieve.fromFireStore(DocumentSnapshot doc)
//  {
//    Map data = doc.data ;
//    return designretrieve(
//        design_title:data['design_title'],
//        price:data['price'],
//        description:data['description'],
//    photourl1:data['photourl1'],
//    photourl2:data['photourl2'],
//    photourl3:data['photourl3'],
//    type:data['type'],
//    id:data['id'],
//
//    );
//
//  }
  Profiledata.fromJson(Map<String, dynamic> data)
      : created_at = "${data['created_at']}",
        updated_at = "${data['updated_at']}",
        id = "${data['id']}",
        dp = "${data['dp']}",
        password = "${data['password']}",
        role_id = "${data['role_id']}",
        firstname = "${data['firstname']}",
        lastname = "${data['lastname']}",
        age = "${data['age']}",
        occupation = "${data['occupation']}",
        country = "${data['country']}",
        state = "${data['state']}",
        date_of_birth = "${data['date_of_birth']}",
        address = "${data['address']}",
        phone = "${data['phone']}",
        lga = "${data['lga']}",
        guardianphonenumber = "${data['guardianphonenumber']}",
        preferredlang = "${data['preferredlang']}",
        pregnancyweeks = "${data['pregnancyweeks']}";

  Map<String, dynamic> toJson() {
    return {
      "created_at": this.created_at,
      "updated_at": this.updated_at,
      "id": this.id,
      "password": this.password,
      "dp": this.dp,
      "role_id": this.role_id,
      "firstname": this.firstname,
      "lastname": this.lastname,
      "age": this.age,
      "occupation": this.occupation,
      "country": this.country,
      "state": this.state,
      "date_of_birth": this.date_of_birth,
      "address": this.address,
      "phone": this.phone,
      "lga": this.lga,
      "guardianphonenumber": this.guardianphonenumber,
      "preferredlang": this.preferredlang,
      "pregnancyweeks": this.pregnancyweeks
    };
  }

  Profiledata.fromMap(Map<String, dynamic> data)
      : created_at = "${data['created_at']}",
        updated_at = "${data['updated_at']}",
        id = "${data['id']}",
        dp = "${data['dp']}",
        password = "${data['password']}",
        role_id = "${data['role_id']}",
        firstname = "${data['firstname']}",
        lastname = "${data['lastname']}",
        age = "${data['age']}",
        occupation = "${data['occupation']}",
        country = "${data['country']}",
        state = "${data['state']}",
        date_of_birth = "${data['date_of_birth']}",
        address = "${data['address']}",
        phone = "${data['phone']}",
        lga = "${data['lga']}",
        guardianphonenumber = "${data['guardianphonenumber']}",
        preferredlang = "${data['preferredlang']}",
        pregnancyweeks = "${data['pregnancyweeks']}";
}
