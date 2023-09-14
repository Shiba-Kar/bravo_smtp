import 'package:bravo_smtp/bravo_smtp.dart';

void main() async {
  var bravoSMTP = BravoSMTP(
      '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');
  final body = Body(
    sender: User(name: 'Admin', email: 'totem.pole249@gmail.com'),
    to: [User(name: 'Shiva', email: 'shibaprasadkar50+test@gmail.com')],
    subject: "Auto Generated Password",
    htmlContent: '<html><body><p>Hello Shiva, ' +
        'welcome to Totempole Commerce. Your Account is ready ! ' +
        'Login with <b>Email</b>:- <b>{{params.email}}</b> and <b>Password</b>:- <b>{{params.password}}</b>' +
        '</p></body></html>',
  );
  print(await bravoSMTP.sendEMAIL(body));
}
