import 'package:flutter/material.dart';
import 'place.dart';  // Import the Place class

class ChurchWatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the list of selected places (churches and beaches) from the arguments
    final List<Place> selectedPlaces = ModalRoute.of(context)?.settings.arguments as List<Place>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Church and Beach Watchlist'),
      ),
      body: selectedPlaces.isEmpty
          ? Center(child: Text('No places added to watchlist!'))
          : ListView.builder(
              itemCount: selectedPlaces.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        selectedPlaces[index].imagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        selectedPlaces[index].name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Functionality to remove from watchlist (if required)
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
