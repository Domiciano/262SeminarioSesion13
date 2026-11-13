import 'package:flutter/material.dart';
import 'package:track_app/components/track_list.dart';
import 'package:track_app/models/track.dart';
import 'package:track_app/services/track_services.dart';

/// Screen that owns the list of tracks and opens the other screens.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackService _trackService = TrackService();
  List<Track> _tracks = [];

  @override
  void initState() {
    super.initState();
    _loadTracks();
  }

  Future<void> _loadTracks() async {
    final tracks = await _trackService.getTracks();
    setState(() {
      _tracks = tracks;
    });
  }

  Future<void> _addTrack(Track draft) async {
    final track = await _trackService.createTrack(draft);
    setState(() {
      _tracks = [..._tracks, track];
    });
  }

  Future<void> _deleteTrack(Track track) async {
    await _trackService.deleteTrack(track.id);
    setState(() {
      _tracks = _tracks.where((t) => t.id != track.id).toList();
    });
  }

  Future<void> _openAddTrack() async {
    final result = await Navigator.pushNamed(context, '/add-track');
    if (result is Track) {
      await _addTrack(result);
    }
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<void> _openTrack(Track track) async {
    final result = await Navigator.pushNamed(
      context,
      '/track',
      arguments: track,
    );
    if (result == true) {
      await _deleteTrack(track);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis tracks'),
        actions: [
          IconButton(
            onPressed: () => _logout(),
            tooltip: 'Cerrar sesión',
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton.icon(
                onPressed: () => _openAddTrack(),
                icon: const Icon(Icons.add),
                label: const Text('Crear track'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TrackList(
                  tracks: _tracks,
                  onOpen: (track) => _openTrack(track),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
