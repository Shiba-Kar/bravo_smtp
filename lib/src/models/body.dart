// To parse this JSON data, do
//
//     final body = bodyFromJson(jsonString);

import 'dart:convert';

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));

String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  User sender;
  List<User> to;
  String subject;
  String htmlContent;

  Body({
    required this.sender,
    required this.to,
    required this.subject,
    required this.htmlContent,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        sender: User.fromJson(json["sender"]),
        to: List<User>.from(json["to"].map((x) => User.fromJson(x))),
        subject: json["subject"],
        htmlContent: json["htmlContent"],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender.toJson(),
        "to": List<dynamic>.from(to.map((x) => x.toJson())),
        "subject": subject,
        "htmlContent": htmlContent,
      };
}

class User {
  String name;
  String email;

  User({
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
