class Ong {
  String _nome = "";
  String _email = "";
  int _cnpj = 0;

  Ong();

  String get nome => _nome;

  set nome(String value) => _nome = value;

  String get email => _email;

  set email(String value) => _email = value;

  int get cnpj => _cnpj;

  set cnpj(int value) {
    _cnpj = value;
  }

  Ong.fromJson(Map<String, dynamic> json)
      : _cnpj = json['cnpj'],
        _email = json['email'],
        _nome = json['nome'];
}
