import 'package:expense_tracker_fiap/models/tipo_transacao.dart';
import 'package:flutter/material.dart';

import '../models/Categoria.dart';

class CategoriaItem extends StatelessWidget {
  final Categoria categoria;
  const CategoriaItem({required this.categoria});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: categoria.cor,
        child: Icon(
          categoria.icone,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(
        categoria.nome,
      ),
      trailing: Text(
        categoria.tipoTransacao == TipoTransacao.despesa
            ? 'Despesa'
            : 'Receita',
        style: TextStyle(
          //fontWeight: FontWeight.w500,
          fontSize: 14,
          color: categoria.tipoTransacao == TipoTransacao.despesa
              ? Colors.pink
              : Colors.green.shade800,
        ),
      ),
    );
  }
}
