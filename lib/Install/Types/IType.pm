package Install::Types::IType;
use Moose::Role;
use Scalar::Util qw(refaddr);

has [qw(image caption h1)] => ( is         => 'ro',
                                isa        => 'Str',
                                lazy_build => 1 );

has 'refaddr' => ( is      => 'ro',
                   isa     => 'Int',
                   default => sub { refaddr($_[0]) } );
                         
has 'is_active' => ( is      => 'ro',
                     isa     => 'Bool',
                     default => 0 );

1;