package Plugins::InstallTypes;
use Mojo::Base   qw(Mojolicious::Plugin);
use Module::Load qw(autoload);
use FindBin      qw($Bin);
use IO::Dir;
use Carp;
use Moose;

my @loadable_modules;

BEGIN {
	my $namespace  = 'Controllers::Types';
	my $lib        = "$Bin/../lib/Controllers/Types";
	my $lib_dir_dh = IO::Dir->new($lib) or croak "Could not load $lib";
    
    @loadable_modules = map { s/\.pm$//i; "$namespace\:\:$_" } grep { m/\w+/ } $lib_dir_dh->read();  
    $lib_dir_dh->close(); # Optional
    autoload($_) foreach(@loadable_modules);	
};

has 'type_controllers' => ( is        => 'ro',
                            traits    => ['Array'],
                            isa       => 'ArrayRef[Controllers::IType]',
                            default   => sub { [] },
                            writer    => '_set_type_controllers',
                            handles   => {
                            	num_types => 'count',
                            	get_all   => 'elements' } );
                  
sub register {
	my ($self, $app, $conf) = @_;

    $self->_set_type_controllers( [ map { $_->new() } @loadable_modules ] );
    $app->helper( install_types => sub { $self->get_all } );
    $app->helper( num_types     => sub { $self->num_types } );
}

no Moose;
1;