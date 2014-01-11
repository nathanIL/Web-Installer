package Controllers::Install::Select;
use Mojo::Base   qw(Mojolicious::Controller);

sub type {
  my $self = shift;
  
  $self->render( template => 'views/install/select', 
                 types    => $self->install_types() );
}


sub questions {
	my $self = shift;
	
	# Render questions
}
1;
