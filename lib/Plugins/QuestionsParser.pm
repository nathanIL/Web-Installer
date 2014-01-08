package Plugins::QuestionsParser;
use Mojo::Base 'Mojolicious::Plugin';
use Mojo::DOM;

sub register {
	my ($self, $app, $conf) = @_;
	my $xml_dom = Mojo::DOM->new($conf->{file});
	
    $app->helper('dom', sub { return $xml_dom } );
}

1;