#-*-cperl-*-

use lib qw(../lib lib);

use Test::More;

use  NodIO::Client;


my $nc = new NodIO::Client;

is( ref $nc, "NodIO::Client", "Object");

$nc = new NodIO::Client( "http://localhost/" );

is( ref $nc, "NodIO::Client", "Object with URL");

done_testing();
