import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final String pseudo;
  final Timestamp timestamp;




   Message(
      {

        required this.pseudo,
        required this.receiverId,
        required this.senderEmail,
        required this.senderId,
        required this.timestamp,
        required this.message,

      });

  Map<String, dynamic> toMap() => {
    "senderId": senderId,
    "senderEmail": senderEmail,
    "receiverId": receiverId,
    "timestamp": timestamp,
    "message": message ,
    "pseudo":pseudo,


  };

}
