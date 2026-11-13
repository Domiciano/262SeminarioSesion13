import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:track_app/models/track.dart';

/// Calls to the tracks table in Supabase.
class TrackService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Track>> getTracks() async {
    final rows = await _client.from('tracks').select();
    return rows.map(Track.fromMap).toList();
  }

  Future<Track> createTrack(Track track) async {
    final row = await _client
        .from('tracks')
        .insert(track.toMap())
        .select()
        .single();
    return Track.fromMap(row);
  }

  Future<void> deleteTrack(String id) async {
    await _client.from('tracks').delete().eq('id', id);
  }
}
