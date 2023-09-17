

firebase-dev-config:
	flutterfire config \
	--project=project-management-app-dev \
	--out=lib/firebase_options_dev.dart \
	--ios-bundle-id=com.example.verygoodcore.progect-management-app.dev \
	--android-app-id=com.example.verygoodcore.progect_management_app.dev

firebase-stg-config:
	flutterfire config \
	--project=project-management-app-stg \
	--out=lib/firebase_options_stg.dart \
	--ios-bundle-id=com.example.verygoodcore.progect-management-app.stg \
	--android-app-id=com.example.verygoodcore.progect_management_app.stg

firebase-prod-config:
	flutterfire config \
	--project=project-management-app-prod \
	--out=lib/firebase_options_prod.dart \
	--ios-bundle-id=com.example.verygoodcore.progect-management-app.prod \
	--android-app-id=com.example.verygoodcore.progect_management_app.prod