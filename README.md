Google Analytics plugin for ikiwiki
===================================

This is a plugin that inserts code snipet required by [Google
Analytics](http://www.google.com/analytics/) into
[ikiwiki](http://ikiwiki.info/) pages.

Installation
------------

Copy `ganalytics.pm` into `/share/perl/5.10.0/IkiWiki/Plugin` and
`ganalytics.tmpl` into `/share/ikiwiki/templates`.

In your `.setup` file load the plugin and add your Google Analytics ID

    add_plugins => [qw{goodstuff ganalytics ....}],
    google_analytics_id => "UA-xxxxxx-x"

Thanks
------

Thanks to
[BerndZeimetz](http://ikiwiki.info/plugins/contrib/tracking/) for the
original version.
