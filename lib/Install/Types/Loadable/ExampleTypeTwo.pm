package Install::Types::Loadable::ExampleTypeTwo;
use Moose;

with 'Install::Types::IType';

sub _build_image {
	'sss';
}

sub _build_h1 {
	'surfing';
}

sub _build_caption {
	'smug';
}

no Moose;
1;
