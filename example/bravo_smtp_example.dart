import 'package:bravo_smtp/bravo_smtp.dart';

void main() async {
  var bravoSMTP = BravoSMTP('xxxxxxxxxxxxxxxxxxxxxxxx');
  final body = Body(
    sender: User(name: 'xxxxx', email: 'xxxxxxxxxx@gmail.com'),
    to: [User(name: 'xxxxxxxx', email: 'sxxxxxxxxxxx+test@gmail.com')],
    subject: "xxxxxxxx",
    htmlContent: '<html><body><p>xxxxxxxxx </p></body></html>',
  );
  //print(json.encode(body.toJson()));
  print(await bravoSMTP.sendEMAIL(body));
}
