import 'package:flutter/material.dart';
import 'package:PokedexApp/PokeDetail.dart';
import 'package:PokedexApp/Pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var url ='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedValue = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedValue);
    print(pokeHub);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text('PokeDex'),
        centerTitle: true,
        leading:
            CircleAvatar(backgroundImage: AssetImage('assets/pokeball.jpg')),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(24, 20),
          ),
        ),
      ),
      body:pokeHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          :  GridView.count(
          crossAxisCount: 2,
          children: pokeHub.pokemon
              .map((Pokemon poke) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PokeDetail(
                          pokemon: poke,
                        )));
                      },
                        child: Card(
                        color: Colors.grey[300],
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                           ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Hero(
                               tag: poke.img,
                               child: Container(
                                height: 100.0,
                                width: 100.0,
                               decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(poke.img))),
                              ),
                            ),
                            Hero( tag: poke.name,
                                                          child: Text(poke.name,
                              style: TextStyle(fontSize: 22,
                              fontWeight: FontWeight.w500 ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
