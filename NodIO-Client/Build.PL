use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'NodIO::Client',
    license             => 'artistic',
    dist_author         => 'JJ Merelo <jjmerelo@gmail.com>',
    dist_version_from   => 'lib/NodIO/Client.pm',
    requires => {
		 'Test::More' => 0,
		 'version'    => 0,
		 'JSON' => 0,
		 'REST::Client' => 0
		},
    add_to_cleanup      => [ 'NodIO-Client-*' ],
);

$builder->create_build_script();
