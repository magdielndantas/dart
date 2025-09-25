import 'package:assincronismo/models/account.dart';
import 'package:assincronismo/services/accountService.dart';
import 'dart:io';

class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen((event) {
      print(event);
    });
  }

  void runChatBot() async {
    print("Iniciando ChatBot...");

    bool isRunning = true;
    while (isRunning) {
      print(
        "Selecione uma opção: 0 - Sair | 1 - Listar Contas | 2 - Adicionar Conta",
      );
      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "0":
            isRunning = false;
            print("Encerrando ChatBot...");
            break;
          case "1":
            await _getAllAccounts();
            break;
          case "2":
            await _addExampleAccount();
            break;
          default:
            print("Opção inválida. Tente novamente.");
        }
      } else {
        print("Entrada inválida. Tente novamente.");
      }
    }
  }

  _getAllAccounts() async {
    List<Account> listAccounts = await _accountService.getAll();
    print(listAccounts);
  }

  _addExampleAccount() async {
    Account example = Account(
      id: "1",
      name: "Magdiel",
      lastName: "Dantas",
      balance: 100.0,
    );

    await _accountService.addAccount(example);
  }
}
