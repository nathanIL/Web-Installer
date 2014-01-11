package WebInstaller;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;
  my $r    = $self->routes;
  
  $r->get('/')->to( namespace  => 'Controllers::Install', 
                    controller => 'Select', 
                    action     => 'type' );

  $r->get('/type')->to( namespace  => 'Controllers::Install', 
                        controller => 'Select', 
                        action     => 'questions' );
}

1;
