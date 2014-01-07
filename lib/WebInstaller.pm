package WebInstaller;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;
  my $r    = $self->routes;
  
  $r->get('/')->to( namespace  => 'Controllers', 
                    controller => 'InstallType', 
                    action     => 'install' );
}

1;
