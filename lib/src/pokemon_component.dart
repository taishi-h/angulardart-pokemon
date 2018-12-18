import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'pokemon.dart';
import 'pokemon_service.dart';

@Component(
  selector: 'pokemons',
  templateUrl: 'pokemon_component.html',
  styleUrls: ['pokemon_component.css'],
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(PokemonService)],
)
class PokemonComponent implements OnInit {
  final PokemonService _pokemonService;

  List<Pokemon> pokemons = [];

  PokemonComponent(this._pokemonService);

  @override
  Future<Null> ngOnInit() async {
    pokemons = await _pokemonService.getAll();
  }
}