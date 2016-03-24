#-*-cperl-*-

use lib qw(../lib lib);

use Test::More tests => 1;

BEGIN {
use_ok( 'NodIO::Client' );
}

diag( "Testing NodIO::Client $NodIO::Client::VERSION" );
