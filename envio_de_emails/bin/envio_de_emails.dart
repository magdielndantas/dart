void enviarEmail(String email) {
  print("Enviando email para $email...");
}

void main() {
  // List<String> listaEmails = [
  //   "joao@email.com",
  //   "maria@email.com",
  //   "eduardo@email.com",
  // ];

  // listaEmails.add("enzo@email.com");

  // if (listaEmails.contains("enzo@email.com")) {
  //   print("O email já está na lista.");
  // } else {
  //   print("O email de Enzo não está na lista.");
  // }

  // for (String email in listaEmails) {
  //   print(email);
  // }

  // Set<String> setEmails = {
  //   "joao@email.com",
  //   "maria@email.com",
  //   "eduardo@email.com",
  // };

  // setEmails.add("enzo@email.com");

  // for (String email in setEmails) {
  //   enviarEmail(email);
  // }

  // if (setEmails.contains("enzo@email.com") == true) {
  //   print("O email já está na lista.");
  // } else {
  //   print("O email não está na lista.");
  // }

  Map<String, String> mapEmails = {
    "João": "joao@email.com",
    "Maria": "maria@email.com",
    "Eduardo": "eduardo@email.com",
  };

  mapEmails["Enzo"] = "enzo@email.com";

  print(mapEmails.containsKey("Enzo"));

  print(mapEmails.values);

  for (String email in mapEmails.keys) {
    print(email);
  }

  for (String email in mapEmails.values) {
    enviarEmail(email);
  }
}
