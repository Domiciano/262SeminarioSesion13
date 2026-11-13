# Sesión 13 · Login y registro con Supabase

Repositorio de arranque del taller de la sesión 13 del Seminario de Ingeniería de
Software.

```shell
flutter pub get
flutter run -d chrome
```

La app abre en el login. Ya tiene las pantallas de inicio de sesión, registro y la
lista de tracks, pero todavía no pide cuenta: *Entrar* y *Crear cuenta* llevan a la
lista sin preguntarle nada a Supabase. En el taller llenas
`lib/services/auth_service.dart` y `lib/services/profile_service.dart` para que
las cuentas sean reales.
