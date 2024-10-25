class Cliente{

String _nome="";
String _email="";


Cliente(this._email , this._nome);
 String get nome => this._nome;

 set nome(String value) => this._nome = value;

 String get email => this._email;

 set email(String value) => this._email = value;
}