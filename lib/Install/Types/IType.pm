package Install::Types::IType;
use Moose::Role;

has [qw(image caption h1)] => ( is         => 'ro',
                                isa        => 'Str',
                                lazy_build => 1 );

has 'controller' => ( is       => 'ro',
                      required => 1,
                      isa      => 'Mojolicious::Controller' );
                         
has 'is_active' => ( is      => 'ro',
                     isa     => 'Bool',
                     default => 0 );

sub get_image_abs_path {
	my $self = shift;
    
    return sprintf("%simg/%s", $self->controller->url_for('/')->to_abs, $self->image);
}
1;