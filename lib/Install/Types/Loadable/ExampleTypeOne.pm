package Install::Types::Loadable::ExampleTypeOne;
use Moose;

with 'Install::Types::IType';

sub _build_image {
	'example_type_one.png';
}

sub _build_h1 {
	'Type One Example';
}

sub _build_caption {
	'Caption testing!! hahahaha <code>Surfing is OK</code>';
}

no Moose;
1;
