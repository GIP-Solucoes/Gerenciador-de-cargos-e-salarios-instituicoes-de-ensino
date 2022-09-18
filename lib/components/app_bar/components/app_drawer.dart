import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

import '../../../constants.dart';
import '../../components.dart';

//layout do menu da esquerda (inicio)
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: kBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                const SizedBox(height: 30.0),
                const LoginButton(),
                const SizedBox(height: 30.0),
                SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        child: TextButton(
                          onPressed: () {
                            if(index!=1){
                              pagina = index;
                            Navigator.popAndPushNamed(context, '/');
                            }
                          },
                          child: Text(
                            navbarItems[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(thickness: 1.0);
                    },
                    itemCount: navbarItems.length,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
