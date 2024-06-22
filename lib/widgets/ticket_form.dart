import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ticket_controller.dart';
import '../model/ticket_model.dart';

class TicketForm extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final roleController = TextEditingController();
  final sectorController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final moduleController = TextEditingController();
  final platformAreaController = TextEditingController();
  final TicketController ticketController = Get.find();

  @override   
  Widget build (BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Nome e Sobrenome'),
            validator: (value){
              if (value == null || value.isEmpty){
                  return 'Por favor, insira seu nome';
              }
              return null;
            },
          ),
          TextFormField(
            controller: companyController,
            decoration: InputDecoration(labelText: 'Empresa'),
            validator: (value) {
              if(value == null || value.isEmpty){
                return 'Por favor, insira o nome da empresa';
              }
              return null;
            },
          ),
          TextFormField(
            controller: roleController,
            decoration: InputDecoration(labelText: 'Cargo ou Função'),
          ),
          TextFormField(
            controller: sectorController,
            decoration: InputDecoration(labelText:'Setor' ),
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Titulo da solicitação'),
            validator: (value) {
              if(value == null || value.isEmpty){
                  return 'Por favor, insira o título da solicitação';
              }
              return null;
            },
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Descrição do pedido'),
            maxLines: 6,
            validator: (value) {
              if(value == null || value.isEmpty){
                return 'Por favor, insira a descrição do seu pedido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: moduleController,
            decoration: InputDecoration(labelText: 'Modulo (Desntista ou Gestão)'),
          ),
          TextFormField(
            controller: platformAreaController,
            decoration: InputDecoration(labelText: 'Área da plataforma'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()){
                  var ticket = Ticket(
                    protocol: DateTime.now().microsecondsSinceEpoch.toString(), 
                    name: nameController.text, 
                    company: companyController.text, 
                    role: roleController.text, 
                    sector: sectorController.text, 
                    title: titleController.text, 
                    description: descriptionController.text, 
                    module: moduleController.text, 
                    platformArea: platformAreaController.text, 
                    requestDate: DateTime.now(),
                    );
                    ticketController.addTicket(ticket);
                    Get.snackbar('Sucesso', 'Ticket criado com Sucesso!');
              }
            },
            child: Text('Abrir Ticket'),
            ),

          ],
        ),
        ), 
      );

  }


}