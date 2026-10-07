import 'package:flutter_test/flutter_test.dart';
import 'package:navegacion/dominio/consumo.dart';

void main(){

  //1
  group("Historia: Registrar consumo", (){

    //Rechazar litros ≤ 0
    test('Rechazar litros <= 0: la regla devuelve error', (){

      expect(ReglaConsumo.validarLitros(0), isNotNull);
      expect(ReglaConsumo.validarLitros(-3), isNotNull);

    });

    //Rechazar litros sobre el tope
    test('Rechazar litros sobre el tope', (){

      expect(ReglaConsumo.validarLitros(10000.5), isNotNull);
      expect(ReglaConsumo.validarLitros(135), isNull);
    });

    //Rechazar kwh <= 0
    test('Rechazar kwh <= 0: La regla devuelve error',(){
      //Rechazar KWH <= 0
      expect(ReglaConsumo.validarKwh(-10), isNotNull);
    });
  });


  group("Historia: Entrar", (){
    test("Correo institucional", (){

      expect(Reglacorreo.esInstitucional("20233tn145@utez.edu.mx"), true);

      expect(Reglacorreo.esInstitucional("isac@protonmail.com"), false);

      expect(Reglacorreo.esInstitucional("@utez.edu.mx"), false);

    });
  });


  MetaSemanal meta = MetaSemanal(100);

  group("Ver meta", (){

    test("Umbral de “se acerca”", (){
      expect(meta.seAcerca(100), true);
      expect(meta.seAcerca(80), true);
      expect(meta.seAcerca(79), false);
    });
  });

  //Actividad Generar siguientes test


  //grupo para segunda historia

  //Validar que solo hay correo institucional
  //rechazar correo de otro dominio
  //Rechazar dominio sin usuario


  //Ver si se acerca a la meta semanal poniendo una meta de 100
  //Prueba donde no se acerca a la meta semanal
}