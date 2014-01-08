package Controllers::Install::Select;
use Mojo::Base 'Mojolicious::Controller';



sub type {
  my $self = shift;

  $self->render( template => 'views/install/select' );
}

1;
