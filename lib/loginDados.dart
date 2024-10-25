class DadosL{
  String login="";
  String senha="";

DadosL(this.login,this.senha);

 String get getNome => this.login;

 set setNome(String nome) => this.login = login;

  get getSenha => this.senha;

 set setSenha( senha) => this.senha = senha;

  
}