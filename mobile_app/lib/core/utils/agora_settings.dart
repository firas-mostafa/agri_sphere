// import 'package:agora_chat_sdk/agora_chat_sdk.dart';

// class AgoraConfig {
//   // 1. Get these from console.agora.io
//   static const String appId = "0528647887d94894bcc95534ea08b7ff";
//   static const String rtcToken =
//       "007eJxTYHhp0RkcP8020PbO+nmqXHMjhGbc3/aX/fvWtXxV9TdiGJsVGAxMjSzMTMwtLMxTLE0sLE2SkpMtTU2NTVITDSySzNPS7pVnZjYEMjK4aDxkZmSAQBCfhaEktbiEgQEAGf8e2w=="; // For Video/Voice
//   static const String chatAppKey =
//       "4110012184#1648294"; // format: orgName#appName
//   static const String tokenChannelName = "test";
//   // 2. Initialize Chat SDK (Call this in main.dart)
//   static Future<void> initChatSdk() async {
//     var options = ChatOptions(appKey: chatAppKey, autoLogin: false);
//     await ChatClient.getInstance.init(options);
//   }

//   // 3. Helper to login to Chat
//   // In a real app, 'token' comes from your backend.
//   static Future<void> loginToChat(String userId, String token) async {
//     try {
//       await ChatClient.getInstance.loginWithAgoraToken(userId, token);
//       print("Chat Login Successful");
//     } on ChatError catch (e) {
//       print("Chat Login Error: ${e.description}");
//     }
//   }
// }
