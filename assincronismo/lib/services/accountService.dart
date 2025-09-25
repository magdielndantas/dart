import 'dart:async';
import 'package:assincronismo/api.dart';
import 'package:assincronismo/models/account.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AccountService {
  StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  String url = 'https://api.github.com/gists/c68bd79e73d8384447efa5ca5a06db29';

  Future<List<Account>> getAll() async {
    Response response = await get(Uri.parse(url));
    _streamController.add("${DateTime.now()} | Requisição de Leitura.");

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic = json.decode(
      mapResponse['files']['accounts.json']['content'],
    );
    List<Account> listAccounts = [];

    for (dynamic dy in listDynamic) {
      Map<String, dynamic> mapAccount = dy as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);
    }

    return listAccounts;
  }

  Future<void> addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);

    List<Map<String, dynamic>> listMapAccounts = [];
    for (Account acc in listAccounts) {
      listMapAccounts.add(acc.toMap());
    }

    String content = json.encode(listMapAccounts);

    Response response = await post(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $githubApiKey'},
      body: json.encode({
        'description': 'accounts.json',
        'public': true,
        'files': {
          'accounts.json': {'content': content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == '2') {
      _streamController.add(
        "${DateTime.now()} | Requisição de Escrita com Sucesso (${account.name}).",
      );
    } else {
      _streamController.add(
        "${DateTime.now()} | Erro na Requisição de Escrita (${account.name}).",
      );
    }
  }

  getAccountById(String id) async {
    List<Account> listAccounts = await getAll();
    if (listAccounts.where((account) => account.id == id).isEmpty) {
      throw Exception('Conta não encontrada.');
    }
    return listAccounts.firstWhere((account) => account.id == id);
  }

  updateAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    if (listAccounts.where((acc) => acc.id == account.id).isEmpty) {
      throw Exception('Conta não encontrada.');
    }
    listAccounts.removeWhere((acc) => acc.id == account.id);
    listAccounts.add(account);
  }

  deleteAccount(String id) async {
    List<Account> listAccounts = await getAll();
    if (listAccounts.where((acc) => acc.id == id).isEmpty) {
      throw Exception('Conta não encontrada.');
    }
    listAccounts.removeWhere((acc) => acc.id == id);
  }
}
