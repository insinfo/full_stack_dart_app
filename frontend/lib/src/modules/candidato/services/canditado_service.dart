import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meu_proj_frontend/src/shared/models/candidato.dart';

class CandidatoService {
  String path = '/candidatos';
  String url = 'http://localhost:8181';

  CandidatoService();

  Future<List<Candidato>> listar() async {
    final resp = await http.get(Uri.parse('$url$path'),
        headers: {'Accept': 'application/json; charset=utf-8'});

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      return data is List ? data.map((e) => Candidato.fromMap(e)).toList() : [];
    }
    throw Exception('Falha ao obter dados ${resp.body}');
  }

  Future<Candidato> getById(int id) async {
    final resp = await http.get(Uri.parse('$url$path/$id'),
        headers: {'Accept': 'application/json; charset=utf-8'});

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      if (data == null) {
        throw Exception('erro ao obter dados');
      }
      return Candidato.fromMap(data);
    }
    throw Exception('Falha ao obter dados ${resp.body}');
  }

  Future<void> cadastrar(Candidato candidato) async {
    final resp = await http.post(Uri.parse('$url$path'),
        headers: {'Content-type': 'application/json; charset=utf-8'},
        body: jsonEncode(candidato.toMap()));
    if (resp.statusCode != 200)
      throw Exception('Falha ao salvar dados ${resp.body}');
  }

  Future<void> atualizar(Candidato candidato) async {
    final resp = await http.put(Uri.parse('$url$path'),
        headers: {'Content-type': 'application/json; charset=utf-8'},
        body: jsonEncode(candidato.toMap()));
    if (resp.statusCode != 200)
      throw Exception('Falha ao atualizar dados ${resp.body}');
  }

  Future<void> remover(Candidato candidato) async {
    final resp = await http.delete(Uri.parse('$url$path'),
        headers: {'Content-type': 'application/json; charset=utf-8'},
        body: jsonEncode(candidato.toMap()));
    if (resp.statusCode != 200)
      throw Exception('Falha ao remover dados ${resp.body}');
  }
}
