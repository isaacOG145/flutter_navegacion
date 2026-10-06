const laboratoriosUtez = ['lab quimica', 'Lab redes', 'Lab fisica'];

class Consumo {
  const Consumo({
    required this.laboratorio,
    required this.litros,
    required this.kwh,
});

  final String laboratorio;
  final double litros;
  final double kwh;
}


class ReglaConsumo {

  static const topelitros = 18038.0;
  static const topekwh = 580.8;


  static String? validarLitros(double? litros){
    if(litros == null) return 'Escribe los litros';
    if(litros <= 0 ) return 'Los litros deben ser mayores a 0';
    if(litros > topelitros) return 'Los litros superan el tope';
  }

  static String? validarKwh(double? kwh){
    if(kwh == null) return 'Escribe los Kwh';
    if(kwh <= 0 ) return 'Los Kwh deben ser mayores a 0';
    if(kwh > topelitros) return 'Los Kwh superan el tope';
  }
}

class Reglacorreo{
  static bool esInstitucional(String correo){
    final limpio = correo.trim().toLowerCase();
    return limpio.endsWith('@utez.edu.mx') && limpio.length > 12;
  }
}

class MetaSemanal {
  const MetaSemanal(this.litrosMeta);

  final double litrosMeta;

  bool seAcerca(double litrosConsumidos) =>
      litrosConsumidos >= litrosMeta * 0.8;
}