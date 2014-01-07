#!/usr/bin/env perl
use strict;
use warnings;
use Mojolicious::Commands;
use FindBin qw($Bin);
use lib     "$Bin/../lib";

my $app = Mojolicious::Commands->start_app('WebInstaller');

$app->plugin('JSONConfig', { file => "$Bin/../conf/app_conf.json" } );
$app->mode($app->config->{mode});
$app->defaults($app->config);
return $app;