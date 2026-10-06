import 'package:flutter/material.dart';
import 'package:navegacion/datos/consumo_repository.dart';
import 'package:navegacion/presentacion/registro_page.dart';

void main() {
  runApp(EcoTrackApp(repositorio: MemoriaConsumoRepository()));
}
class EcoTrackApp extends StatelessWidget{
  const EcoTrackApp ({super.key, required this.repositorio});

  final ConsumoRepository repositorio;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'EcoTrack',
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: RegistroPage(repositorio: repositorio),
    );
  }
}
