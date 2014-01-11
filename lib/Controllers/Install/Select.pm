package Controllers::Install::Select;
use Mojo::Base   qw(Mojolicious::Controller);
use Module::Load qw(autoload);
use Carp;
use IO::Dir;

sub _load_types {
	my $self = shift;
	my $dir  = $self->stash('loadable_types_dir');
	my $ln   = $self->stash('loadable_types_namespace');
	my $lib_dir_dh = IO::Dir->new($dir) or croak "Could not load $dir";
	my @modules = map { s/\.pm$//i; "$ln\:\:$_" } grep { m/\w+/ } $lib_dir_dh->read(); 
	
	$lib_dir_dh->close();
	autoload($_) foreach(@modules);   
	return [ map { $_->new( controller => $self) } @modules ];
}

sub type {
  my $self = shift;
  CORE::state $types = $self->_load_types();

  $self->render( template => 'views/install/select' , types => $types );
}


sub questions {
	my $self = shift;
	
	# Render questions
}
1;
