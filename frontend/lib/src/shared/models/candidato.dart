class Candidato {
  int id;
  String nome;
  String telefone;

  Candidato({
    this.id = -1,
    this.nome = '',
    this.telefone = '',
  });

  factory Candidato.fromMap(Map<String, dynamic> data) {
    return Candidato(
      id: data['id'],
      nome: data['nome'],
      telefone: data['telefone'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
    };
  }
}
