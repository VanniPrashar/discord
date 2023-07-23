import 'package:discord/discord.dart' as discord;
import 'package:discord/models/user.dart';
import 'package:discord/models/servers.dart';
import 'package:args/args.dart';
import 'dart:io';

// Future<void> main(List<String> arguments) async {
//   final input = stdin.readLineSync().toString();
//   switch (input) {
//     case "register":
//       await Users.Register();
//     case "Login":
//       await Users.Login();
//     case "Logout":
//       await Users.Logout();
//     case "isLogin":
//       final res = await Users.isLoggedin();
//       print(res);
//   }
// }

Future<void> main(List<String> arguments) async {
  final parser = ArgParser();
  parser.addCommand('register');
  parser.addCommand('login');
  parser.addCommand('logout');
  parser.addCommand('isLogin');

  parser.addOption('username', abbr: 'u'); // Adding the 'username' option.

  final results = parser.parse(arguments);

  if (results.command == null) {
    print("Usage: dart your_script_name.dart <command>");
    print(parser.usage);
    return;
  }

  final command = results.command!.name;

  switch (command) {
    case 'register':
      await Users.Register();
      break;
    case 'login':
      // if (results.rest.isEmpty) {
      //   print("Please provide a username using -u <username>");
      //   return;
      // }
      // final username = results.rest[0]!;
      // final username = results.rest.isEmpty ? null : results.rest[0];

      // final username = results.rest.isNotEmpty ? results.rest[0] : null;
      //
      await Users.Login();
      break;
    case 'logout':
      await Users.Logout();
      break;

    case 'isLogin':
      final res = await Users.isLoggedin();
      print(res);

    default:
      print("Invalid command: $command");
      print(parser.usage);
      break;
  }
}
