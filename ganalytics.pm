#!/usr/bin/perl
package IkiWiki::Plugin::ganalytics;

use warnings;
use strict;
use IkiWiki 3.00;

sub import {
        hook(type => "getsetup", id => "ganalytics", call => \&getsetup);
        hook(type => "pagetemplate", id => "ganalytics", call => \&pagetemplate);
}

sub getsetup () {
        return
                plugin => {
                        safe => 1,
                        rebuild => 1,
                        section => "other",
                },
		google_analytics_id => {
			type => "string",
			example => "UA-xxxxxx-x",
			description => "Google Analytics tracking id",
			safe => 1,
			rebuild => 1,
		}
}

my $googleout;
sub pagetemplate (@) {
	my %params=@_;
	my $page=$params{page};
	my $template=$params{template};

	if ($template->query(name => "meta")) {
		my $value=$template->param("meta");

		if (defined $config{google_analytics_id}) {
			if (! defined $googleout) {
				my $googletemplate = template("ganalytics.tmpl", blind_cache => 1);
				$googletemplate->param(googleanalyticsid => $config{google_analytics_id});
				$googleout=$googletemplate->output;
			}
			$value.=$googleout;
		}

		$template->param(meta => $value);
	}
}

1
