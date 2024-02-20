import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:loveria/common/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class PremiumProfileViewAlert extends StatefulWidget {
  String? imageUrl;

  String? name;

  String? date;

  String? city;

  PremiumProfileViewAlert(
      {super.key, this.city, this.date, this.imageUrl, this.name});

  @override
  State<PremiumProfileViewAlert> createState() =>
      _PremiumProfileViewAlertState();
}

class _PremiumProfileViewAlertState extends State<PremiumProfileViewAlert> {
  bool isBlur = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isBlur ? _profie().blurred(blur: 10) : _profie(),
                const SizedBox(
                  height: 32,
                ),
                Visibility(
                  visible: isBlur,
                  child: const Text(
                    '''If you press "yes", the regular match button will be muted once you have viewed the profile.''',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isBlur = false;
                        });

                        if (isBlur == false) {
                          var msg =
                              '''Hello, I want to do premium matching with ${userInfo["full_name"]} (#${userInfo["_id"]}) ''';

                          var whatsappUrl = Uri.parse(
                              "whatsapp://send?phone=${"+85290802890"}" +
                                  "&text=${Uri.encodeComponent(msg)}");

                          try {
                            launchUrl(whatsappUrl);
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        }
                      },
                      child: Text(isBlur == true ? 'Yes' : "Continue"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Visibility(
                      visible: isBlur,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('No'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Container _profie() {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(widget.imageUrl!),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.name ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
