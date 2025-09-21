import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando() {
  print(
    'Digite o comando (1 - adicionar, 2 - listar, 3 - remover, 4 - sair): ',
  );
  List<String>? comandos = <String>['1', '2', '3', '4'];
  String? entrada = "";

  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)) {
    print('Comando inválido. Tente novamente.');
    return getComando();
  }

  return entrada!;
}

List<String> adicionarNota(List<String> notas) {
  print("Escreva uma nota:");
  String? nota = "";

  nota = stdin.readLineSync();

  if (nota == null || nota.isEmpty) {
    print("Nota inválida. Tente novamente.");
    return adicionarNota(notas);
  }

  notas.add(nota!);
  print("Nota adicionada com sucesso.");

  return notas;
}

void listarNotas(List<String> notas) {
  if (notas.isEmpty) {
    print("Nenhuma nota disponível.");
  } else {
    print("Notas:");
    for (int i = 0; i < notas.length; i++) {
      print("${i + 1}. ${notas[i]}");
    }
  }
}

void menu(List<String> notas) {
  cabecalho();
  String comando = getComando();

  switch (comando) {
    case '1':
      adicionarNota(notas);
      break;
    case '2':
      listarNotas(notas);
      break;
    case '3':
      // Implementar remoção de nota
      break;
    case '4':
      print("Saindo...");
      exit(0);
    default:
      print("Comando inválido.");
  }

  menu(notas);
}

void cabecalho() {
  print("                                             ");
  print(" __    _  _______  _______  _______  _______ ");
  print("|  |  | ||       ||       ||   _   ||       |");
  print("|   |_| ||   _   ||_     _||  |_|  ||  _____|");
  print("|       ||  | |  |  |   |  |       || |_____ ");
  print("|  _    ||  |_|  |  |   |  |       ||_____  |");
  print("| | |   ||       |  |   |  |   _   | _____| |");
  print("|_|  |__||_______|  |___|  |__| |__||_______|");
  print("                                             ");

}
