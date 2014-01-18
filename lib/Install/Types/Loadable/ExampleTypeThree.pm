package Install::Types::Loadable::ExampleTypeThree;
use Moose;

with 'Install::Types::IType';

sub _build_image {
	'example_type_one.png';
}

sub _build_h1 {
	'Type Three Example';
}

sub _build_caption {
	'Three type testing <code>Test type 3</code>';
}

no Moose;
1;
