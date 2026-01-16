// import 'package:agora_chat_sdk/agora_chat_sdk.dart';
// import 'package:flutter/material.dart';

// class ChatPage extends StatefulWidget {
//   final String engineerId; // The ID of the person we are chatting with
//   final String engineerName;

//   const ChatPage({
//     super.key,
//     required this.engineerId,
//     required this.engineerName,
//   });

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController _msgController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   final List<ChatMessage> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//     _setupChatListener();
//     _loadHistory();
//   }

//   void _setupChatListener() {
//     // Listen for incoming messages
//     ChatClient.getInstance.chatManager.addEventHandler(
//       "UNIQUE_HANDLER_ID",
//       ChatEventHandler(
//         onMessagesReceived: (messages) {
//           for (var msg in messages) {
//             if (msg.from == widget.engineerId) {
//               setState(() {
//                 _messages.add(msg);
//               });
//               _scrollToBottom();
//             }
//           }
//         },
//       ),
//     );
//   }

//   Future<void> _loadHistory() async {
//     try {
//       ChatConversation? conversation = await ChatClient.getInstance.chatManager
//           .getConversation(
//             widget.engineerId,
//             type: ChatConversationType.Chat,
//             createIfNeed: true,
//           );

//       List<ChatMessage> history = await conversation?.loadMessages() ?? [];
//       setState(() {
//         _messages.addAll(history);
//       });
//       _scrollToBottom();
//     } catch (e) {
//       debugPrint("Error loading history: $e");
//     }
//   }

//   Future<void> _sendMessage() async {
//     if (_msgController.text.trim().isEmpty) return;

//     String text = _msgController.text;
//     var msg = ChatMessage.createTxtSendMessage(
//       targetId: widget.engineerId,
//       content: text,
//     );

//     // Optimistic Update
//     setState(() {
//       _messages.add(msg);
//       _msgController.clear();
//     });
//     _scrollToBottom();

//     // Send to Agora
//     ChatClient.getInstance.chatManager
//         .sendMessage(msg)
//         .then((_) {
//           debugPrint("Message sent");
//         })
//         .catchError((e) {
//           debugPrint("Message failed: $e");
//         });
//   }

//   void _scrollToBottom() {
//     Future.delayed(const Duration(milliseconds: 100), () {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
//     _msgController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.engineerName), elevation: 1),
//       body: Column(
//         children: [
//           // Chat List
//           Expanded(
//             child: ListView.separated(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(16),
//               itemCount: _messages.length,
//               separatorBuilder: (_, __) => const SizedBox(height: 10),
//               itemBuilder: (context, index) {
//                 final msg = _messages[index];
//                 final isMe = msg.direction == MessageDirection.SEND;

//                 // Extract text content safely
//                 String text = "";
//                 if (msg.body.type == MessageType.TXT) {
//                   text = (msg.body as ChatTextMessageBody).content;
//                 } else {
//                   text = "[Media]";
//                 }

//                 return Align(
//                   alignment: isMe
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       color: isMe ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Text(
//                       text,
//                       style: TextStyle(
//                         color: isMe ? Colors.white : Colors.black87,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // Input Area
//           Container(
//             padding: const EdgeInsets.all(10),
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _msgController,
//                     decoration: InputDecoration(
//                       hintText: "Type a message...",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 IconButton(
//                   icon: const Icon(Icons.send, color: Colors.blue),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
