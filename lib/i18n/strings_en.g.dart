///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$en common = _Translations$common$en._(_root);
	@override late final _Translations$login$en login = _Translations$login$en._(_root);
	@override late final _Translations$home$en home = _Translations$home$en._(_root);
	@override String get settings => 'Settings';
	@override String get language => 'Language';
	@override String get english => 'English';
	@override String get japanese => 'Japanese';
	@override String get favorites => 'Favorites';
	@override String get notifications => 'Notifications';
}

// Path: common
class _Translations$common$en implements Translations$common$ja {
	_Translations$common$en._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get email => 'Email';
	@override String get emailRequired => 'Email is required';
	@override String get password => 'Password';
	@override String get passwordRequired => 'Password is required';
}

// Path: login
class _Translations$login$en implements Translations$login$ja {
	_Translations$login$en._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override String get signIn => 'Sign in';
}

// Path: home
class _Translations$home$en implements Translations$home$ja {
	_Translations$home$en._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Home';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.email' => 'Email',
			'common.emailRequired' => 'Email is required',
			'common.password' => 'Password',
			'common.passwordRequired' => 'Password is required',
			'login.title' => 'Login',
			'login.signIn' => 'Sign in',
			'home.title' => 'Home',
			'settings' => 'Settings',
			'language' => 'Language',
			'english' => 'English',
			'japanese' => 'Japanese',
			'favorites' => 'Favorites',
			'notifications' => 'Notifications',
			_ => null,
		};
	}
}
