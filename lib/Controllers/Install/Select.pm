package Controllers::Install::Select;
use Mojo::Base   qw(Mojolicious::Controller);

sub type {
  my $self = shift;
  
  $self->render( template => 'views/install/select', 
                 types    => $self->install_types() );
}


sub questions {
	my $self          = shift;
    my %type_map      = $self->install_types_by_refaddr();
    my $selected_type = $type_map{ $self->param('id') };	
	
	# Render questions
	$self->render( template => 'views/install/questions' );
}

sub results {
	my $self = shift;
	
}
1;
