import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';
import '../models/transacao.dart';

class TransacoesReepository {
  Future<List<Transacao>> listarTransacoes(
      {TipoTransacao? tipoTransacao}) async {
    final supabase = Supabase.instance.client;

    final data =
        await supabase.from('transacoes').select<List<Map<String, dynamic>>>('''
            id,
            descricao,
            tipo_transacao,
            valor,
            observacoes,
            data_transacao,

            categorias (
             id,
             descricao,
             cor,
             icone,
             tipo_transacao
            ),

            contas (
              id,
              descricao,
              tipo_conta,
              banco
            )
            ''');

    final list = data.map((map) {
      final mapCategory = map['categorias'];
      final mapContas = map['contas'];

      return Transacao(
        id: map['id'],
        descricao: map['descricao'],
        tipoTransacao: TipoTransacao.values[map['tipo_transacao']],
        valor: map['valor'],
        data: DateTime.parse(map['data_transacao']),
        categoria: Categoria(
          id: mapCategory['id'],
          descricao: mapCategory['descricao'],
          cor: Color(mapCategory['cor']),
          icone: IoniconsData(mapCategory['icone']),
          tipoTransacao: TipoTransacao.values[mapCategory['tipo_transacao']],
        ),
        conta: Conta(
          id: mapContas['id'],
          descricao: mapContas['descricao'],
          tipoConta: TipoConta.values[mapContas['tipo_conta']],
          bancoId: mapContas['banco'],
        ),
      );
    }).toList();

    return list;
  }
}
