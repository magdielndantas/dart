void enviarEmail(String email) {
  print("Enviando email para $email...");
}

void main() {
  List<String> listaEmails = ["joao@email.com", "maria@email.com", "eduardo@email.com"];

  listaEmails.add("enzo@email.com");

  for (String email in listaEmails) {
    print(email);
  }
}
