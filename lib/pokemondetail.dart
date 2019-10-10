import 'package:flutter/material.dart';
import 'package:tryingjson/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  handlePokemonColor(type) {
    switch (type) {
      case 'Grass':
        return Colors.lightGreen;
      case 'Poison':
        return Colors.purpleAccent;
      case 'Water':
        return Colors.lightBlue;
      case 'Rock':
      case 'Ground':
        return Colors.brown[200];
      case 'Electric':
        return Colors.yellow[300];
      case 'Fire':
        return Colors.red;
      case 'Bug':
        return Colors.teal;
      case 'Psychic':
        return Colors.purpleAccent;
      case 'Ghost':
        return Colors.indigo;
      case 'Dark':
        return Colors.brown[300];
      case 'Ice':
        return Colors.lightBlueAccent;
      default:
        return Colors.deepOrangeAccent;
    }
  }

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                              label: Text(t),
                              onSelected: (b) {},
                              backgroundColor: handlePokemonColor(t),
                            ))
                        .toList(),
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  pokemon.weaknesses == null
                      ? Text("-")
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.weaknesses
                              .map((t) => FilterChip(
                                    label: Text(t),
                                    onSelected: (b) {},
                                    backgroundColor: handlePokemonColor(t),
                                  ))
                              .toList(),
                        ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  pokemon.nextEvolution == null
                      ? Text("Do not evolve")
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.nextEvolution
                              .map((evolution) => FilterChip(
                                    label: Text(evolution.name),
                                    onSelected: (b) {},
                                    backgroundColor:
                                        handlePokemonColor(pokemon.type[0]),
                                  ))
                              .toList())
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: handlePokemonColor(pokemon.type[0]),
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: handlePokemonColor(pokemon.type[0]),
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }
}
