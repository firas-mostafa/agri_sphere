// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_app/core/utils/agora_settings.dart';
// import 'package:permission_handler/permission_handler.dart';

// class CallPage extends StatefulWidget {
//   final String channelName;
//   final bool isVideo;

//   const CallPage({super.key, required this.channelName, required this.isVideo});

//   @override
//   State<CallPage> createState() => _CallPageState();
// }

// class _CallPageState extends State<CallPage> {
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   late RtcEngine _engine;
//   bool _isMicMuted = false;

//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//   }

//   Future<void> _initAgora() async {
//     // 1. Request Permissions
//     await [Permission.microphone, Permission.camera].request();

//     // 2. Create the Engine using the App ID from Config
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(
//       const RtcEngineContext(
//         appId: AgoraConfig.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ),
//     );

//     // 3. Register Event Handlers
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("Local user ${connection.localUid} joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("Remote user $remoteUid joined");
//           setState(() {
//             _remoteUid = remoteUid;
//           });
//         },
//         onUserOffline:
//             (
//               RtcConnection connection,
//               int remoteUid,
//               UserOfflineReasonType reason,
//             ) {
//               debugPrint("Remote user $remoteUid left channel");
//               setState(() {
//                 _remoteUid = null;
//               });
//               // End call if engineer leaves
//               if (mounted) Navigator.pop(context);
//             },
//       ),
//     );

//     // 4. Enable Video or Audio only
//     if (widget.isVideo) {
//       await _engine.enableVideo();
//       await _engine.startPreview();
//     } else {
//       await _engine.enableAudio();
//     }

//     // 5. Join Channel using the Token from Config
//     await _engine.joinChannel(
//       token: AgoraConfig.rtcToken,
//       channelId: widget.channelName,
//       uid: 0, // 0 lets Agora assign a UID automatically
//       options: const ChannelMediaOptions(
//         clientRoleType: ClientRoleType.clientRoleBroadcaster,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // ------------------------------------
//           // 1. Remote View (The Engineer) - Full Screen
//           // ------------------------------------
//           Center(
//             child: _remoteUid != null
//                 ? AgoraVideoView(
//                     controller: VideoViewController.remote(
//                       rtcEngine: _engine,
//                       canvas: VideoCanvas(uid: _remoteUid),
//                       connection: RtcConnection(channelId: widget.channelName),
//                     ),
//                   )
//                 : Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const CircularProgressIndicator(color: Colors.white),
//                       const SizedBox(height: 20),
//                       Text(
//                         widget.isVideo
//                             ? 'Waiting for engineer...'
//                             : 'Voice Call Connected',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       if (!widget.isVideo)
//                         const Padding(
//                           padding: EdgeInsets.only(top: 20.0),
//                           child: Icon(
//                             Icons.person,
//                             size: 100,
//                             color: Colors.white24,
//                           ),
//                         ),
//                     ],
//                   ),
//           ),

//           // ------------------------------------
//           // 2. Local View (Me) - Small Box (Only for Video)
//           // ------------------------------------
//           if (_localUserJoined && widget.isVideo)
//             Positioned(
//               right: 20,
//               top: 50,
//               width: 100,
//               height: 150,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: AgoraVideoView(
//                     controller: VideoViewController(
//                       rtcEngine: _engine,
//                       canvas: const VideoCanvas(uid: 0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//           // ------------------------------------
//           // 3. Control Buttons
//           // ------------------------------------
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildCallButton(
//                   icon: _isMicMuted ? Icons.mic_off : Icons.mic,
//                   color: _isMicMuted ? Colors.white : Colors.blueAccent,
//                   iconColor: _isMicMuted ? Colors.black : Colors.white,
//                   onTap: () {
//                     setState(() {
//                       _isMicMuted = !_isMicMuted;
//                     });
//                     _engine.muteLocalAudioStream(_isMicMuted);
//                   },
//                 ),
//                 const SizedBox(width: 24),
//                 _buildCallButton(
//                   icon: Icons.call_end,
//                   color: Colors.red,
//                   iconColor: Colors.white,
//                   onTap: () => Navigator.pop(context),
//                 ),
//                 if (widget.isVideo) ...[
//                   const SizedBox(width: 24),
//                   _buildCallButton(
//                     icon: Icons.switch_camera,
//                     color: Colors.white24,
//                     iconColor: Colors.white,
//                     onTap: () => _engine.switchCamera(),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCallButton({
//     required IconData icon,
//     required Color color,
//     required Color iconColor,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: CircleAvatar(
//         radius: 30,
//         backgroundColor: color,
//         child: Icon(icon, color: iconColor, size: 28),
//       ),
//     );
//   }
// }
