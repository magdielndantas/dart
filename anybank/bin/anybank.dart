import 'package:anybank/conta.dart';

void main() {
  ContaCorrente contaMario = ContaCorrente("Mario", 4000.0);
  ContaPoupanca contaAna = ContaPoupanca("Ana", 5000.0);
  ContaEmpresa contaJoao = ContaEmpresa("João", 6000.0);
  ContaInvestimento contaPedro =
      ContaInvestimento("Pedro", 7000.0);

  print("-----");
  contaMario.enviar(6000.0);
  contaAna.enviar(6000.0);
  contaJoao.receber(6000.0);
  contaPedro.enviar(6000.0);
}
