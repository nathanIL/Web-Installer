package Install::Questions::IQuestion;
use Moose::Role;
use Scalar::Util qw(refaddr);

requires qw(validate);

has 'refaddr' => ( is      => 'ro',
                   isa     => 'Int',
                   default => sub { refaddr($_[0]) } );

has 'template' => ( is       => 'ro',
                    isa      => 'Str',
                    required => 1 );
no Moose;
1;