import 'package:flutter/material.dart';
import 'package:tugasakhir/model/breeds_image_model.dart';
import 'package:tugasakhir/service/api_data_source.dart';

class BreedsImagePage extends StatefulWidget {
  final String breedName;

  const BreedsImagePage({Key? key, required this.breedName}) : super(key: key);

  @override
  _BreedsImagePageState createState() => _BreedsImagePageState();
}

class _BreedsImagePageState extends State<BreedsImagePage> {
  late Future<BreedsImage> breedsImage;

  @override
  void initState() {
    super.initState();
    breedsImage = ApiDataSource.instance
        .loadByBreed(widget.breedName)
        .then((data) => BreedsImage.fromJson(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breedName),
        backgroundColor: const Color(0xFF1B1A55),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<BreedsImage>(
        future: breedsImage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading images'));
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: snapshot.data?.message?.length ?? 0,
              itemBuilder: (context, index) {
                String imageUrl = snapshot.data!.message![index];
                return Image.network(imageUrl, fit: BoxFit.cover);
              },
            );
          } else {
            return const Center(child: Text('No images available'));
          }
        },
      ),
    );
  }
}
