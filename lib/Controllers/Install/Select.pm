package Controllers::Install::Select;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub type {
  my $self = shift;


  $self->render( template => 'views/install/select' );
}

1;
