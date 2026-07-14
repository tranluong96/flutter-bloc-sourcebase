///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$common$ja common = Translations$common$ja._(_root);
	late final Translations$login$ja login = Translations$login$ja._(_root);
	late final Translations$home$ja home = Translations$home$ja._(_root);

	/// ja: '設定'
	String get settings => '設定';

	/// ja: '言語'
	String get language => '言語';

	/// ja: '英語'
	String get english => '英語';

	/// ja: '日本語'
	String get japanese => '日本語';

	/// ja: 'お気に入り'
	String get favorites => 'お気に入り';

	/// ja: '通知'
	String get notifications => '通知';
}

// Path: common
class Translations$common$ja {
	Translations$common$ja._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'メールアドレス'
	String get email => 'メールアドレス';

	/// ja: 'メールアドレスは必須です'
	String get emailRequired => 'メールアドレスは必須です';

	/// ja: 'パスワード'
	String get password => 'パスワード';

	/// ja: 'パスワードは必須です'
	String get passwordRequired => 'パスワードは必須です';
}

// Path: login
class Translations$login$ja {
	Translations$login$ja._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ログイン'
	String get title => 'ログイン';

	/// ja: 'ログイン'
	String get signIn => 'ログイン';
}

// Path: home
class Translations$home$ja {
	Translations$home$ja._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ホーム'
	String get title => 'ホーム';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.email' => 'メールアドレス',
			'common.emailRequired' => 'メールアドレスは必須です',
			'common.password' => 'パスワード',
			'common.passwordRequired' => 'パスワードは必須です',
			'login.title' => 'ログイン',
			'login.signIn' => 'ログイン',
			'home.title' => 'ホーム',
			'settings' => '設定',
			'language' => '言語',
			'english' => '英語',
			'japanese' => '日本語',
			'favorites' => 'お気に入り',
			'notifications' => '通知',
			_ => null,
		};
	}
}
