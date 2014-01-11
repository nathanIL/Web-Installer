package Plugins::InstallTypes;
use Mojo::Base   qw(Mojolicious::Plugin);
use Module::Load qw(autoload);
use Carp;
use IO::Dir;


sub register {
  my ($self, $app, $conf) = @_;
  my $dir        = $conf->{loadable_types_dir}; 
  my $ln         = $conf->{loadable_types_namespace};
  my $lib_dir_dh = IO::Dir->new($dir) or croak "Could not load $dir";
  my @modules    = map { s/\.pm$//i; "$ln\:\:$_" } grep { m/\w+/ } $lib_dir_dh->read(); 
	
  $lib_dir_dh->close();
  autoload($_) foreach(@modules);
 
  $app->helper('install_types' => sub { [ map { $_->new() } @modules ] } ); 
}
1;