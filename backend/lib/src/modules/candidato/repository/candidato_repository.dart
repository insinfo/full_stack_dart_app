import 'package:meu_proj_backend/src/db/db.dart';

class CandidatoRepository {
  Future<List<Map<String, dynamic>>> listar() async {
    final data = await db.table('candidatos').selectRaw('*').get();
    return data;
  }

  Future<Map<String, dynamic>?> getById(int id) async {
    return await db.table('candidatos').where('id', '=', id).first();
  }

  Future<void> cadastrar(Map<String, dynamic> data) async {
    data.remove('id');
    await db.table('candidatos').insert(data);
  }

  Future<void> atualizar(Map<String, dynamic> data) async {
    await db.table('candidatos').where('id', '=', data['id']).update(data);
  }

  Future<void> remover(Map<String, dynamic> data) async {
    await db.table('candidatos').where('id', '=', data['id']).delete();
  }
}
