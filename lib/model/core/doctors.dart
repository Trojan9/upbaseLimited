class Doctorsdata {
  String id;
  String firstname;
  String lastname;
  String phone;
  String dp;
  String email;
  String user_id;
  String date;
  String doctor_id;
  String centre_id;
  String time;
  String status;
  String speciality;
  String homeaddress;
  String officeaddress;
  String occupation;
  String yearsofexperience;
  String guardianphonenumber;
  String age;
  String ratings;
  String created_at;
  String updated_at;
  String date_of_birth;
  String lga;
  String country_id;
  String state_id;
  String Document;
  String state;
  String role_id;
  String country;
  Doctorsdata({
    this.country,
    this.id,
    this.role_id,
    this.dp,
    this.firstname,
    this.lastname,
    this.Document,
    this.officeaddress,
    this.homeaddress,
    this.lga,
    this.phone,
    this.state,
    this.date_of_birth,
    this.age,
    this.country_id,
    this.state_id,
    this.guardianphonenumber,
    this.speciality,
    this.yearsofexperience,
    this.created_at,
    this.ratings,
    this.updated_at,
    this.occupation,
    this.centre_id,
    this.date,
    this.doctor_id,
    this.status,
    this.time,
    this.user_id,
  });
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
  Doctorsdata.fromJson(Map<String, dynamic> data)
      : created_at = "${data['created_at']}",
        updated_at = "${data['updated_at']}",
        id = "${data['id']}",
        role_id = "${data['role_id']}",
        dp = "${data['image']}",
        Document = "${data["document"]}",
        email = "${data["email"]}",
        ratings = "${data["ratings"]}",
        firstname = "${data['first_name']}",
        lastname = "${data['last_name']}",
        age = "${data['age']}",
        occupation = "${data['profession']}",
        country = "${data['country']}",
        state = "${data['state']}",
        date_of_birth = "${data['dob']}",
        homeaddress = "${data['home_address']}",
        officeaddress = "${data['office_address']}",
        phone = "${data['phone_number']}",
        lga = "${data['lga']}",
        country_id = "${data['country_id']}",
        state_id = "${data['state_id']}",
        centre_id = "${data['centre_id']}",
        date = "${data['date']}",
        doctor_id = "${data['doctor_id']}",
        status = "${data['status']}",
        time = "${data['time']}",
        user_id = "${data['user_id']}",
        guardianphonenumber = "${data['husband_guardian_phone']}",
        speciality = "${data['specialty']}",
        yearsofexperience = "${data['years_of_experience']}";
  Doctorsdata.fromMap(Map<String, dynamic> data)
      : created_at = "${data['created_at']}",
        updated_at = "${data['updated_at']}",
        id = "${data['id']}",
        role_id = "${data['role_id']}",
        dp = "${data['image']}",
        ratings = "${data["ratings"]}",
        Document = "${data["document"]}",
        email = "${data["email"]}",
        firstname = "${data['first_name']}",
        lastname = "${data['last_name']}",
        age = "${data['age']}",
        occupation = "${data['profession']}",
        country = "${data['country']}",
        state = "${data['state']}",
        date_of_birth = "${data['dob']}",
        homeaddress = "${data['home_address']}",
        officeaddress = "${data['office_address']}",
        phone = "${data['phone_number']}",
        lga = "${data['lga']}",
        country_id = "${data['country_id']}",
        state_id = "${data['state_id']}",
        centre_id = "${data['centre_id']}",
        date = "${data['date']}",
        doctor_id = "${data['doctor_id']}",
        status = "${data['status']}",
        time = "${data['time']}",
        user_id = "${data['user_id']}",
        guardianphonenumber = "${data['husband_guardian_phone']}",
        speciality = "${data['specialty']}",
        yearsofexperience = "${data['years_of_experience']}";
}
