import 'package:flutter/material.dart';
import 'package:machine_test/design/home/home_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF312782);
    return ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(builder: (context, data, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: primary,
              ),
            ),
            title: const Text('Network directly',
                style: TextStyle(
                  color: primary,
                )),
            actions: [
              const Icon(
                Icons.list_alt,
                color: primary,
              ).paddingRight(10),
              Icon(
                Icons.location_on,
                color: primary.withOpacity(0.5),
              ).paddingRight(5),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Center(
                      child: Icon(Icons.person),
                    ),
                  ).paddingRight(5),
                  Text(
                    'ROHITH PV',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ).paddingSymmetric(vertical: 10),
              Text(
                '01-Oct-2022 to 30-Sep-2023',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade500),
              ).paddingSymmetric(vertical: 5),
              const _CardWithIcon(text: 'Provider Type'),
              Row(
                children: [
                  Expanded(child: _CardWithIcon(text: 'Country')),
                  Expanded(child: _CardWithIcon(text: 'City')),
                ],
              ).paddingSymmetric(vertical: 10),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primary)
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.search,size: 15,).paddingRight(5), Text('Search')]).paddingSymmetric(vertical: 10)),
              ).paddingSymmetric(vertical: 10,horizontal: 10),
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Find Nearest Providers',style: context.textTheme.titleLarge,),
                Switch(
                    activeColor: primary,
                    value: data.enable, onChanged: (val){
                  data.enable=! data.enable;
                  data.refresh();
                })
              ],),
              Column(
                children: data.list.map((e) {
                  return _CusCard(
                      head: e['head'],
                      location: e['location'],
                      place: e['place'],
                      distance: e['distance'],
                      country: e['country']);
                }).toList(),
              ).paddingSymmetric(vertical: 10)
            ],
          ),
        );
      }),
    );
  }
}

class _CusCard extends StatelessWidget {
  final String head;
  final String location;
  final String place;
  final String distance;
  final String country;

  const _CusCard(
      {Key? key,
      required this.head,
      required this.location,
      required this.place,
      required this.distance,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final light = Colors.black.withOpacity(0.5);
    final style = TextStyle(color: light, fontSize: 15);
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          head,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ).paddingSymmetric(vertical: 10),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: light,
                      ).paddingRight(5),
                      Text(
                        place,
                        style: style,
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: light,
                      ).paddingRight(5),
                      Expanded(
                          child: Text(
                        location,
                        style: style,
                      )),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ],
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.call_outlined,
                        color: Color(0xFF312782),
                        size: 16,
                      ),
                      Icon(
                        Icons.mail,
                        color: Color(0xFF312782),
                        size: 16,
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: light,
                      ).paddingRight(5),
                      Expanded(
                          child: Text(
                        country,
                        style: style,
                      )),
                    ],
                  ).paddingSymmetric(vertical: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.telegram,
                        color: light,
                      ).paddingRight(5),
                      Text(
                        distance,
                        style: style,
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10));
  }
}

class _CardWithIcon extends StatelessWidget {
  final String text;

  const _CardWithIcon({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text), const Icon(Icons.arrow_drop_down_sharp)],
      ).paddingSymmetric(vertical: 10, horizontal: 10),
    );
  }
}
