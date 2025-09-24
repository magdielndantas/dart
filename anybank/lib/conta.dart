// Classes = Moldes
abstract class Conta {
  String titular;
  double _saldo; // private

  // Construtor = Função de criação
  Conta(this.titular, this._saldo);

  // Métodos = Funções
  void receber(double valor) {
    if (valor > 0) {
      _saldo += valor;
      saldoAtual();
    } else {
      print("Valor inválido");
    }
  }

  void enviar(double valor) {
    if (_saldo >= valor) {
      _saldo -= valor;
      saldoAtual();
    } else {
      print("Saldo insuficiente");
    }
  }

  void saldoAtual() {
    print("Saldo atual de $titular é de R\$$_saldo.");
  }
}

// Heranca e polimorfismo
class ContaCorrente extends Conta {
  double emprestimo = 1000.0;

  ContaCorrente(super.titular, super._saldo);

  // Sobrescrita de método
  @override
  void enviar(double valor) {
    if (_saldo + emprestimo >= valor) {
      _saldo -= valor;
      saldoAtual();
    } else {
      print("Saldo insuficiente, mesmo com o empréstimo");
    }
  }
}

class ContaPoupanca extends Conta {
  double taxaJuros = 0.05;

  ContaPoupanca(super.titular, super._saldo);

  void aplicarJuros() {
    double juros = _saldo * taxaJuros;
    receber(juros);
  }
}

// interfaces e mixins
mixin Imposto {
  double taxa = 0.03;

  double valorTaxado(double valor) {
    return valor * taxa;
  }
}

class ContaEmpresa extends Conta with Imposto {
  ContaEmpresa(super.titular, super._saldo);

  @override
  void enviar(double valor) {
    double valorComTaxa = valor + valorTaxado(valor);
    if (_saldo >= valorComTaxa) {
      _saldo -= valorComTaxa;
      saldoAtual();
    } else {
      print("Saldo insuficiente para cobrir o valor e a taxa");
    }
  }

  @override
  void receber(double valor) {
    double valorComTaxa = valor - valorTaxado(valor);
    if (valorComTaxa > 0) {
      _saldo += valorComTaxa;
      saldoAtual();
    } else {
      print("Valor inválido após taxa");
    }
  }
}

class ContaInvestimento extends Conta with Imposto {
  ContaInvestimento(super.titular, super._saldo);

  @override
  void enviar(double valor) {
    double valorComTaxa = valor + valorTaxado(valor);
    if (_saldo >= valorComTaxa) {
      _saldo -= valorComTaxa;
      saldoAtual();
    } else {
      print("Saldo insuficiente para cobrir o valor e a taxa");
    }
  }

  @override
  void receber(double valor) {
    double valorComTaxa = valor - valorTaxado(valor);
    if (valorComTaxa > 0) {
      _saldo += valorComTaxa;
      saldoAtual();
    } else {
      print("Valor inválido após taxa");
    }
  }
}
