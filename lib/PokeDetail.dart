import 'package:flutter/material.dart';
import 'package:PokedexApp/Pokemon.dart';


class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;
    PokeDetail({this.pokemon});

    bodyWidget(BuildContext context)=>Stack(
      children: <Widget>[
        
        Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width/1,
          child: SingleChildScrollView(
              child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              
              child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: <Widget>[
                  SizedBox(height: 120,),
                  //Text(pokemon.name,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),SizedBox(height: 40,),
                  Text('Height:${pokemon.height}',style:TextStyle(fontSize: 18,)),SizedBox(height: 10,),
                  Text('Weight:${pokemon.weight}',style:TextStyle(fontSize: 18,)),SizedBox(height: 10,),
                  Text('Types',style:TextStyle(fontSize: 18,)),SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type.map((t) => FilterChip(label: Text(t,style:TextStyle(fontSize: 15,)),backgroundColor: Colors.amber, onSelected: (bool){})).toList(),

                    
                    
                  ),SizedBox(height: 20,),
                  Text('Weakness',style:TextStyle(fontSize: 18,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(spacing: 10,
                      
                      children: pokemon.weaknesses.map((w) => FilterChip(label: Text(w,style: TextStyle(color: Colors.white,fontSize: 15),),backgroundColor: Colors.deepPurple, onSelected: (bool){})).toList(),
                      
                    ),
                  ),
                  //SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 10,
            top: -10,
            child: Hero(tag: pokemon.img, child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(pokemon.img)
            )
            ),
            ),
          ),
          
        )
      ],
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      
      body: SafeArea(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: <Widget>[
            Container(
            height: 100.0,
            decoration: new BoxDecoration(
            color: Colors.red[400],
            boxShadow: [ 
            new BoxShadow(blurRadius: 9.0, offset: Offset(0, 10),color: Colors.grey[800])
            
            ],
            borderRadius: new BorderRadius.vertical(
            bottom: new Radius.elliptical(
            MediaQuery.of(context).size.width, 120.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    CircleAvatar(backgroundColor: Colors.white,radius: 20.0,
                        child: GestureDetector(onTap: () => Navigator.pop(context),child: CircleAvatar(backgroundImage: AssetImage('assets/blue.jpg'),maxRadius: 17.5,))),SizedBox(width: 1.8,),
                    GestureDetector(onTap: () => Navigator.pop(context),child: CircleAvatar(backgroundImage: AssetImage('assets/red.jpg'),radius: 8.0,)),SizedBox(width: 1.8,),
                    CircleAvatar(backgroundImage: AssetImage('assets/yellow.jpg'),radius: 8.0,),SizedBox(width: 1.8,),
                    CircleAvatar(backgroundImage: AssetImage('assets/green.jpg'),radius: 8.0,),
                    SizedBox(width: 55,),
                    Text('Pokedex',style: TextStyle(fontSize: 25,color: Colors.white),),
                    
                  ],
                ),
                SizedBox(height: 18,),
                Text(pokemon.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white)),
              ],
            ),
  ),      
          Padding(padding: EdgeInsets.only(top: 20),
          child:bodyWidget(context),),
          ],
        ),
      ),
    // floatingActionButton: FloatingActionButton.extended(onPressed: (){
     
      
    // },icon: Icon(Icons.navigate_next,), label: Text('Evolve'),backgroundColor: Colors.red[600],),

    );
  }
}