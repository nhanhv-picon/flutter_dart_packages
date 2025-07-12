bootstrap:
	melos bootstrap
init-package:
	melos run init-package
build-runner:
	melos run build-runner
build-runner-watch:
	melos run build-runner-watch
brw:
	make build-runner-watch
l10n:
	dart run picon_remote_localizations:l10n
gen-assets:
	melos run gen-assets
images:
	make gen-assets
format:
	melos run format
clean:
	melos run clean
pub-verify:
	melos run pub-verify
pub-publish:
	melos run pub-publish
gen-splash:
	dart run flutter_native_splash:create
check-unused-files:
	dart pub global activate dart_code_linter
	melos check-unused-files
check-unused-l10n:
	dart pub global activate dart_code_linter
	melos check-unused-l10n
check-unused-code:
	dart pub global activate dart_code_linter
	melos check-unused-code
analyze:
	melos analyze
analyze-package:
	melos analyze-package
unused-l10n:
	dart run codebase:check_unused_l10n

#fb-dev:
#	flutterfire configure \
#      --debug \
#      --project=anyjob-dev \
#      --platforms="android,ios" \
#      --out=lib/firebase_options/firebase_options_dev.dart \
#      --ios-bundle-id=jp.paytech.anyjob.dev \
#      --ios-out=./configs/GoogleService-Info-dev.plist \
#      --android-package-name=jp.paytech.anyjob.dev \
#      --android-out=./android/app/src/dev/google-services.json
#
#fb-stg:
#	flutterfire configure \
#      --debug \
#      --project=anyjob-dev \
#      --platforms="android,ios" \
#      --out=lib/firebase_options/firebase_options_stg.dart \
#      --ios-bundle-id=jp.paytech.anyjob.stg \
#      --ios-out=configs/GoogleService-Info-stg.plist \
#      --android-package-name=jp.paytech.anyjob.stg \
#      --android-out=android/app/src/stg/google-services.json
#fb-preProd:
#	flutterfire configure \
#      --debug \
#      --project=anyjob-dev \
#      --platforms="android,ios" \
#      --out=lib/firebase_options/firebase_options_preProd.dart \
#      --ios-bundle-id=jp.paytech.anyjob.preProd \
#      --ios-out=configs/GoogleService-Info-preProd.plist \
#      --android-package-name=jp.paytech.anyjob.preProd \
#      --android-out=android/app/src/preProd/google-services.json
#fb-prod:
#	flutterfire configure \
#      --debug \
#      --project=anyjob-f3c4a \
#      --platforms="android,ios" \
#      --out=lib/firebase_options/firebase_options_prod.dart \
#      --ios-bundle-id=jp.paytech--jp.paytech \
#      --ios-out=configs/GoogleService-Info-prod.plist \
#      --android-package-name=jp.paytech.anyjob \
#      --android-out=android/app/src/prod/google-services.json
#
#update-deps:
#	./bin/update_dependency.sh build_runner ^2.6.0-dev.1
