package Install::Types::IType;
use Moose::Role;

has [qw(image caption h1)] => ( is         => 'ro',
                                isa        => 'Str',
                                lazy_build => 1 );

                         
has 'is_active' => ( is      => 'ro',
                     isa     => 'Bool',
                     default => 0 );

1;