// class employees {
//   List<Users>? users;

//   var length;

//   employees({this.users});

//   employees.fromJson(Map<String, dynamic> json) {
//     if (json['Users'] != null) {
//       users = <Users>[];
//       json['Users'].forEach((v) {
//         users!.add(new Users.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.users != null) {
//       data['Users'] = this.users!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Users {
//   String? name;
//   String? fname;
//   String? pno;

//   Users({this.name, this.fname, this.pno});

//   Users.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     fname = json['fname'];
//     pno = json['Pno'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['fname'] = this.fname;
//     data['Pno'] = this.pno;
//     return data;
//   }

//   static fromMap(item) {}
// }

class employees {
  String? name;
  String? fname;
  String? pno;

  employees({this.name, this.fname, this.pno});

  employees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fname = json['fname'];
    pno = json['Pno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fname'] = this.fname;
    data['Pno'] = this.pno;
    return data;
  }
}
