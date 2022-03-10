import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                child: Image.asset(
                  'assets/umbrella2.png',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
                child: Text(
                    '  Umbrella Corp. - trans.: Военная и фармацевтическая транснациональная корпорация, основанная 22 октября 1968 года. Являлась одним из крупнейших фармацевтических конгломератов, базирующихся в Европе. Umbrella официально разработала и внедрила широкий спектр лекарственных средств, косметических продуктов и других производных, таких как продукты питания. Кроме того, корпорация вела разработки в области биологического оружия и успешно продавала его террористическим организациям, что является основным источником доходов корпорации по настоящее время...'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
