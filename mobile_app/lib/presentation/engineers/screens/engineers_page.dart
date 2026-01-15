import 'package:flutter/material.dart';
import 'package:mobile_app/data/models/engineer_models.dart/engineer_model.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/engineers/widgets/engineer_card.dart';
import 'package:mobile_app/presentation/store/widget/falling_dots.dart';

class EngineerPage extends StatefulWidget {
  const EngineerPage({super.key});

  @override
  State<EngineerPage> createState() => _EngineerPageState();
}

class _EngineerPageState extends State<EngineerPage> {
  final List<EngineerModel> _dummyEngineers = [
    EngineerModel(
      id: 1,
      name: "Dr. Ahmed Ali",
      specialty: "Plant Pathology & Seeds",
      imageUrl: "https://i.pravatar.cc/150?u=a",
      rating: 4.8,
      isOnline: true,
      consultationFee: 50.0,
    ),
    EngineerModel(
      id: 1,
      name: "Dr. Ahmed Ali",
      specialty: "Plant Pathology & Seeds",
      imageUrl: "https://i.pravatar.cc/150?u=a",
      rating: 4.8,
      isOnline: true,
      consultationFee: 50.0,
    ),
    EngineerModel(
      id: 2,
      name: "Eng. Sarah Smith",
      specialty: "Soil Fertility Expert",
      imageUrl: "https://i.pravatar.cc/150?u=b",
      rating: 4.5,
      isOnline: false,
      consultationFee: 40.0,
    ),
    EngineerModel(
      id: 3,
      name: "Eng. John Doe",
      specialty: "Hydroponics Engineer",
      imageUrl: "https://i.pravatar.cc/150?u=c",
      rating: 4.9,
      isOnline: true,
      consultationFee: 65.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text("Expert Engineers", style: context.textTheme.titleLarge),
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: context.colorScheme.onSurface),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Positioned.fill(child: FallingDots()),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setMineSize(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: context.setHeight(10)),
                      itemCount: _dummyEngineers.length,
                      itemBuilder: (context, index) {
                        final engineer = _dummyEngineers[index];

                        return EngineerCard(
                          engineer: engineer,
                          onChat: () {},
                          onVoiceCall: () {},
                          onVideoCall: () {},
                        );
                      },
                    ),
                    SizedBox(height: context.setHeight(100)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
