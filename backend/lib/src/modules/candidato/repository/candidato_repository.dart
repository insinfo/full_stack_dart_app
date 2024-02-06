import 'package:meu_proj_backend/src/db/db.dart';

class CandidatoRepository {
  Future<List<Map<String, dynamic>>> listar() async {
    final data = await db.table('candidatos').selectRaw('*').get();
    return data;
  }

  Future<void> cadastrar(Map<String, dynamic> data) async {
    data.remove('id');
    await db.table('candidatos').insert(data);
  }
}
