gen:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o app_strings.g.dart
bootstrap:
	sh ./scripts/bootstrap.sh -fv 2.5.3
clean:
	sh ./scripts/clean.sh