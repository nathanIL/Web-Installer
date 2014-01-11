package Controllers::Install::Select;
use Mojo::Base 'Mojolicious::Controller';


use Data::Dumper;

sub type {
  my $self = shift;
  
#  print Dumper($self->install_types->get_all);
  $self->render( template => 'views/install/select' );
}

1;
