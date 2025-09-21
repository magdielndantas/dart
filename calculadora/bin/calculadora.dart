import 'dart:io';

void main() {
  double numeroUm = 0;
  double numeroDois = 0;
  String operacao = "";
  String? entrada = "";
  List<String> operacoesValidas = <String>['+', '-', '*', '/'];
  var resultado;

  void soma() {
    resultado = numeroUm + numeroDois;
    print(resultado);
  }

  void subtracao() {
    resultado = numeroUm - numeroDois;
    print(resultado);
  }

  void multiplicacao() {
    resultado = numeroUm * numeroDois;
    print(resultado);
  }

  void divisao() {
    resultado = numeroUm / numeroDois;
    print(resultado);
  }

  void calcular() {
    switch (operacao) {
      case '+':
        soma();
        break;
      case '-':
        subtracao();
        break;
      case '*':
        multiplicacao();
        break;
      case '/':
        divisao();
        break;
      default:
        print('Operação inválida');
    }
  }

  void getOperacao() {
    print('Digite a operação ${operacoesValidas.toString()}:');
    entrada = stdin.readLineSync();
    if (entrada != null) {
      if (operacoesValidas.contains(entrada)) {
        operacao = entrada!;
      } else {
        print('Operação inválida. Tente novamente.');
        getOperacao();
      }
    }
  }

  print('Digite o primeiro número:');
  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numeroUm = double.parse(entrada!);
    }
  }

  getOperacao();

  print('Digite o segundo número:');
  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numeroDois = double.parse(entrada!);
    }
  }

  print('O resultado é:');
  calcular();
}
