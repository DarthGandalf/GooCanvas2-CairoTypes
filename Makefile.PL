use ExtUtils::MakeMaker;
use ExtUtils::Depends;
use ExtUtils::PkgConfig;

my $depends = ExtUtils::Depends->new('GooCanvas2::CairoTypes', 'Glib', 'Cairo');

sub add_dep {
	my $name = shift;
	my %obj = ExtUtils::PkgConfig->find($name);
	$depends->set_inc($obj{cflags});
	$depends->set_libs($obj{libs});
}

add_dep('goocanvas-2.0');

WriteMakefile(
	ABSTRACT_FROM => 'lib/GooCanvas2/CairoTypes.pm',
	AUTHOR => ['Alexey Sokolov <sokolov@google.com>'],
	DISTNAME => 'GooCanvas2-CairoTypes',
	NAME => 'GooCanvas2::CairoTypes',
	VERSION_FROM => 'lib/GooCanvas2/CairoTypes.pm',
	LICENSE => 'perl_5',
	BUILD_REQUIRES => {
		Glib => 0,
		Cairo => 0,
	},
	CONFIGURE_REQUIRES => {
		'ExtUtils::MakeMaker' => 0,
		'ExtUtils::Depends' => 0,
		'ExtUtils::PkgConfig' => 0,
	},
	PREREQ_PM => {
		Gtk3 => 0,
		XSLoader => 0,
	},
	XSMULTI => 1,
	$depends->get_makefile_vars,
);
