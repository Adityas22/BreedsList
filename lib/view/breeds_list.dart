import 'package:flutter/material.dart';
import 'package:tugasakhir/model/breeds_list_model.dart';
import 'package:tugasakhir/service/api_data_source.dart';
import 'package:tugasakhir/service/favorite_manager.dart';
import 'package:tugasakhir/view/breeds_image.dart';
import 'package:tugasakhir/view/favorite.dart';

class BreedsPage extends StatefulWidget {
  const BreedsPage({Key? key}) : super(key: key);

  @override
  _BreedsPageState createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  late Future<BreedsList> breedsList;
  final FavoritesService _favoritesService = FavoritesService();
  List<String> _favorites = [];
  List<String> _breeds = [];
  String _searchTerm = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    breedsList = ApiDataSource.instance
        .loadAllBreeds()
        .then((data) => BreedsList.fromJson(data));
    _loadFavorites();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text.toLowerCase();
    });
  }

  Future<void> _loadFavorites() async {
    final favorites = await _favoritesService.getFavorites();
    setState(() {
      _favorites = favorites;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeds Dog!!'),
        backgroundColor: const Color(0xFF1B1A55),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search breeds...',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<BreedsList>(
              future: breedsList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading breeds'));
                } else if (snapshot.hasData) {
                  _breeds = snapshot.data!.message!.toJson().keys.toList();
                  final filteredBreeds = _breeds
                      .where((breed) => breed
                          .toLowerCase()
                          .contains(_searchTerm.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    itemCount: filteredBreeds.length,
                    itemBuilder: (context, index) {
                      String breed = filteredBreeds[index];
                      bool isFavorite = _favorites.contains(breed);
                      return ListTile(
                        title: Text(breed),
                        trailing: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onPressed: () async {
                            if (isFavorite) {
                              await _favoritesService.removeFavorite(breed);
                              _showSnackBar('Berhasil dihapus dari favorit');
                            } else {
                              await _favoritesService.addFavorite(breed);
                              _showSnackBar('Berhasil ditambah ke favorit');
                            }
                            _loadFavorites();
                          },
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BreedsImagePage(
                              breedName: breed,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No breeds available'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
