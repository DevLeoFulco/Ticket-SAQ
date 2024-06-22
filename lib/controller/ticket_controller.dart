import 'package:get/get.dart';
import '../model/ticket_model.dart';

class TicketController extends GetxController{
    var tickets = <Ticket>[].obs;

    void addTicket (Ticket ticket){
      tickets.add(ticket);
    }

    void updateTicketStatus(String protocol, String status,{String? reason}){
        var ticket = tickets.firstWhere((t)=> t.protocol == protocol);
        ticket.status = status;
        if (reason !=null){
          ticket.pendingReason=reason;
        }
        tickets.refresh();

    }

    Ticket? getTicketByProtocol(String protocol){
      return tickets.firstWhereOrNull((t)=>t.protocol == protocol);
    }

}