import 'package:flutter/material.dart';

var dataObjects = [
  {
    "name": "Demetrious Johnson",
    "weightClass": "Peso Mosca",
    "defenses": "11",
  },
  {
    "name": "Jon Jones",
    "weightClass": "Peso Meio-Pesado",
    "defenses": "11",
  },
  {
    "name": "Anderson Silva",
    "weightClass": "Peso Médio",
    "defenses": "10",
  },
  {
    "name": "George St. Pierre",
    "weightClass": "Peso Meio-Médio",
    "defenses": "9",
  },
  {
    "name": "José Aldo",
    "weightClass": "Peso Pena",
    "defenses": "7",
  },
  {
    "name": "Valentina Shevchenko",
    "weightClass": "Peso Mosca",
    "defenses": "7",
  },
  {
    "name": "Amanda Nunes",
    "weightClass": "Peso Pena",
    "defenses": "7",
  },
  {
    "name": "Matt Hughes",
    "weightClass": "Peso Meio-Médio",
    "defenses": "7",
  },
  {
    "name": "Ronda Rousey",
    "weightClass": "Peso Pena",
    "defenses": "6",
  },
  {
    "name": "Tito Ortiz",
    "weightClass": "Peso Meio-Pesado",
    "defenses": "5",
  },
  {
    "name": "Joanna Jedrzejczyk",
    "weightClass": "Peso Palha",
    "defenses": "5",
  },
  {
    "name": "Kamaru Usman",
    "weightClass": "Peso Meio-Médio",
    "defenses": "5",
  },
  {
    "name": "Israel Adesanya",
    "weightClass": "Peso Médio",
    "defenses": "5",
  },
  {
    "name": "Tyron Woodley",
    "weightClass": "Peso Meio-Médio",
    "defenses": "4",
  },
  {
    "name": "Renan Barão",
    "weightClass": "Peso Galo",
    "defenses": "4",
  },
  {
    "name": "Chuck Liddell",
    "weightClass": "Peso Meio-Pesado",
    "defenses": "4",
  },
  {
    "name": "Alexander Volkanovski",
    "weightClass": "Peso Pena",
    "defenses": "4",
  },
];

void main() {
  newApp app = newApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Campeões do UFC com mais defesas de cinturão"),
          ),
          body: Center(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataBodyWidget(
                      objects: dataObjects,
                      columnNames: ["Nome", "Categoria", "Defesas"],
                      propertyNames: ["name", "weightClass", "defenses"]))),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class newApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Campeões do UFC com mais defesas de cinturão"),
          ),
          body: Center(
              child: MyTileWidget(
                  objects: dataObjects,
                  columnNames: ["Nome", "Categoria", "Defesas"],
                  propertyNames: ["name", "weightClass", "defenses"])),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Campeões",
        icon: Icon(Icons.flag_outlined),
      ),
      BottomNavigationBarItem(
          label: "Categoria", icon: Icon(Icons.flag_outlined)),
      BottomNavigationBarItem(label: "Defesas", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;
  DataBodyWidget(
      {this.objects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: objects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}

class MyTileWidget extends StatelessWidget {
  List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  MyTileWidget(
      {this.objects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (context, index) {
        final obj = objects[index];

        final columnTexts = columnNames.map((col) {
          final prop = propertyNames[columnNames.indexOf(col)];
          return Text("$col: ${obj[prop]}");
        }).toList();

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnTexts,
          ),
        );
      },
    );
  }
}
