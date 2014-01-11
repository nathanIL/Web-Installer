#!/usr/bin/env perl
use strict;
use warnings;
use Mojolicious::Commands;
use FindBin qw($Bin);
use lib     "$Bin/../lib";


sub set_plugins {
	$_[0]->plugin('JSONConfig',{ file => "$Bin/../conf/app_conf.json" } );
}

sub set_application_mode {
	$_[0]->mode($_[0]->config->{mode});
}

sub set_application_defaults {
	my $defaults = $_[0]->config // {};
    
    $defaults->{loadable_types_dir}       = "$Bin/../lib/Install/Types/Loadable";
    $defaults->{loadable_types_namespace} = 'Install::Types::Loadable';
	$_[0]->defaults($defaults);
}

sub set_log_destination {
	$_[0]->log->handle(\*STDOUT); # For Debugging
}


my $app = Mojolicious::Commands->start_app('WebInstaller');

set_log_destination($app);
set_plugins($app);
set_application_mode($app);
set_application_defaults($app);

return $app;