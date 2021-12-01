import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';
import 'package:pokedexapp/screen/pokemon_detail_screen.dart';
import 'package:pokedexapp/utils/pokemon_util.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonListItem({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: PokemonUtils.getColor(pokemon),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => PokemonDetailScreen(
                        id: pokemon.id,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    pokemon.id,
                    style: TextStyle(color: Colors.grey[200], fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                pokemon.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: pokemon.types
                          .map((type) => Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: PokemonUtils.getColorType(type),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(type,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Hero(
                      tag: "pokemon${pokemon.id}",
                      child: Image.network(
                        pokemon.imageUrl,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
