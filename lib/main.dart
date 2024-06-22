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

class  MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return GetMaterialApp(
      title: 'Ticket Suporte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget{
  final TicketController ticketController = Get.put(TicketController());

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Suporte'),
        actions: [
          DropdownButton<String>(onChanged: (value){
            if (value == 'Desenvolvedor'){
              //Parte onde devo solicitar a chave de acesso
              Get.to(DeveloperView());
            }else{
              Get.to(UserView());
            }
          },
          items: [
            DropdownMenuItem(value:'Usuário', child: Text('Usuário'),),
            DropdownMenuItem(value: 'Desenvolvedor',child: Text('Desenvolvedor'),),
          ],
          hint: Text('Selecione o perfil'),
          ),
        ],
      ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Get.to(CriarTicketView());
                  } , 
                  child: Text('Abrir Ticket'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      Get.to(CheckTicketView());
                    } , 
                    child: Text('Consultar Ticket'))
              ],
            ),
          ),
    );
      
  }


  

}
