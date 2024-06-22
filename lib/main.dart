import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/ticket_controller.dart';
import 'view/developer_view.dart';
import 'view/user_view.dart';
import 'view/criar_ticket_view.dart';
import 'view/check_ticket_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ticket Suporte',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final TicketController ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Suporte'),
        actions: [
          DropdownButton<String>(
            onChanged: (value) {
              if (value == 'Desenvolvedor') {
                // Parte onde devo solicitar a chave de acesso
                Get.to(DeveloperView());
              } else {
                Get.to(UserView());
              }
            },
            items: [
              DropdownMenuItem(value: 'Usuário', child: Text('Usuário')),
              DropdownMenuItem(value: 'Desenvolvedor', child: Text('Desenvolvedor')),
            ],
            hint: Text('Selecione o perfil'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/planoDeFundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(CriarTicketView());
                  },
                  child: Text('Abrir Ticket', style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(CheckTicketView());
                  },
                  child: Text('Consultar Ticket', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}