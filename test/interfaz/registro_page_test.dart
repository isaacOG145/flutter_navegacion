import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navegacion/datos/consumo_repository.dart';
import 'package:navegacion/presentacion/registro_page.dart';
import 'package:navegacion/presentacion/resumen_page.dart';

//funcion auxiliar que nos permite construir la pantalla a probar
Widget pantalla()=> MaterialApp(home:RegistroPage(repositorio: MemoriaConsumoRepository(),));

//Punto de entrada aqui se declaran todos los casos de prueba en el archivo
void main() {
  //CASO 1: litros vacios
  testWidgets(
      'Con litros vacios se lee el mensaje y la pantalla de resumen no aparece', (
      tester) async {
    //Dibuja la pantalla de registro, como si el usuario la abriera
    await tester.pumpWidget(pantalla());
    //Escribir 3 dola en el campo de kwh. eñ de litros se deja vacio a proposito para el test
    await tester.enterText(find.byKey(const Key('campoKwh')), '3');

    //Dar click al boton de continuar en el formulario, que dispara la validacion del mismo
    await tester.tap(find.text('Continuar'));

    await tester.pumpAndSettle();
    //Verificar que aparece exactamente el texto esperado una vez se dan las validaciones
    expect(find.text('Escribe los litros'), findsOneWidget);

    // verificar que no se navega a la pantalla siguiente
    expect(find.byType(ResumenPage), findsNothing);
  });

  // CASO 2: Litros en 0
  testWidgets('Con litros en cero se lee el mensaje de rango', (tester) async {
    await tester.pumpWidget(pantalla());

    //Escibe los litros en 0 en el campo correspondiente
    await tester.enterText(find.byKey(const Key('campoLitros')), '0');

    //Escibe 3 solo en el campo de kwh, el de litros se deja vacio a proposito para el test
    await tester.enterText(find.byKey(const Key('campoKwh')), '3');

    // dar click al boton
    await tester.tap(find.text('Continuar'));

    //esperar el renderizado
    await tester.pumpAndSettle();

    //Mensaje de rangno
    expect(find.text('Los litros deben ser mayores que 0'), findsOneWidget);

    // no hay navegacion
    expect(find.byType(ResumenPage), findsNothing);
  });

  // CASO 3: Datos validos

  testWidgets('Los litros y kwh son validos ', (tester) async {

    await tester.pumpWidget(pantalla());

    await tester.enterText(find.byKey(const Key('campoLitros')), '12.5');

    await tester.enterText(find.byKey(const Key('campoKwh')), '50');

    await tester.tap(find.text('Continuar'));

    await tester.pumpAndSettle();

  expect(find.byType(ResumenPage), findsOneWidget);
  });
}