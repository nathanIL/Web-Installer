package Controllers::InstallType;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub install {
  my $self = shift;


  $self->render( template => 'views/install' );
}

1;
