use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('WebInstaller');
#$t->get_ok('/')->status_is(200)->content_like(q/./i);

done_testing();
