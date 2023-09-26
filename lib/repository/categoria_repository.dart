import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';

class CategoriaRepository {
  Future<List<Categoria>> listarCategorias(
      {TipoTransacao? tipoTransacao}) async {
    final supabase = Supabase.instance.client;
    final data =
        await supabase.from('categorias').select<List<Map<String, dynamic>>>();

    final categorias = data
        .map((e) => Categoria(
              id: e['id'],
              descricao: e['descricao'],
              tipoTransacao: TipoTransacao.values[e['tipo_transacao']],
              icone: IoniconsData(e['icone']),
              cor: Color(e['cor']),
            ))
        .toList();

    return categorias;
  }
}
