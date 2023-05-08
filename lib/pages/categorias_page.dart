import 'package:expense_tracker_fiap/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../components/categoria_item.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage();

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final categorias = CategoriaRepository().obterCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorias'),
        ),
        body: ListView.separated(
          itemCount: categorias.length,
          itemBuilder: (context, index) {
            final categoria = categorias[index];
            return CategoriaItem(categoria: categoria);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}
