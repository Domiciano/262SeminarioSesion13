# AGENTS.md

App Flutter de práctica de la sesión 13 del Seminario: una lista de tracks
guardada en la tabla `tracks` de Supabase, con registro e inicio de sesión
por Supabase Auth.

## Estructura

- `lib/main.dart`: `MaterialApp` con la tabla de rutas nombradas.
- `lib/models/track.dart`: el modelo `Track`, con `fromMap`, `toMap` y `copyWith`.
- `lib/models/profile.dart`: el modelo `Profile`, igual.
- `lib/components/`: widgets reutilizables.
- `lib/screens/`: pantallas con `Scaffold` (`LoginScreen`, `SignupScreen`,
  `HomeScreen`, `AddTrackScreen`, `TrackDetailScreen`). La ruta inicial es
  `/login`.
- `lib/services/`: las únicas clases que hablan con Supabase.
  `AuthService` (cuentas y sesión), `ProfileService` (tabla `profiles`) y
  `TrackService` (tabla `tracks`).

## La tabla tracks

- `id` uuid, llave primaria, la genera la base de datos.
- `name` text, obligatorio.
- `artist_name` text, obligatorio.
- `image_url` text, puede ser null. Si llega null, la app usa
  `Track.defaultImageUrl` (`https://picsum.photos/400`).

## La tabla profiles

- `id` uuid, llave primaria. **No** la genera la base de datos: es el `id` del
  usuario en Auth (`auth.users`), que devuelve `signUp`.
- `name` text, obligatorio.
- `email` text, obligatorio.

## Reglas

- Solo los servicios llaman a Supabase. Las pantallas llaman a los servicios.
- Los métodos de los servicios que van a Supabase devuelven un `Future` y se
  usan con `await`.
- Sin paginación y sin manejo de estado con paquetes: solo `setState`.
- Código en inglés; textos de la interfaz en español.
- Imports del proyecto con `package:track_app/`, nunca relativos.
- Sin comentarios en el código, salvo una línea `///` por clase pública.
- `Function()` y `Function(Tipo)` en vez de `VoidCallback` y `ValueChanged`.
