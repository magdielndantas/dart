import 'package:assincronismo/screens/accountScreen.dart';

void main() {
  AccountScreen accountscreen = AccountScreen();
  accountscreen.initializeStream();
  accountscreen.runChatBot();
}
