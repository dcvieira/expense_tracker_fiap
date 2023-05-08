import 'package:expense_tracker_fiap/models/tipo_transacao.dart';
import 'package:flutter/material.dart';

class Categoria {
  String id;
  String nome;
  Color cor = Colors.red;
  IconData icone;
  TipoTransacao tipoTransacao;

  Categoria({
    required this.id,
    required this.nome,
    required this.cor,
    required this.icone,
    required this.tipoTransacao,
  });
}
