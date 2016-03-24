#-*-cperl-*-

use lib qw(../lib lib);

use Test::More;
use JSON;
use  NodIO::Client;
use Test::HTTP::Server;
  
my $server = Test::HTTP::Server->new();

use constant GET_RESPONSE => { chromosome => "101010101010" };
use constant PUT_RESPONSE => {  chromosome=> "010101010102",
				length => 1,
				updated => 'TRUE' };

sub Test::HTTP::Server::Request::random {
  my $self = shift;
  return encode_json( GET_RESPONSE );
}

sub Test::HTTP::Server::Request::one {
  my $self = shift;
  return encode_json( PUT_RESPONSE );
}

my $nc = new NodIO::Client;

is( ref $nc, "NodIO::Client", "Object");

$nc = new NodIO::Client( $server->uri );

is( ref $nc, "NodIO::Client", "Object with URL");


is_deeply $nc->get(), GET_RESPONSE, "GET";

done_testing();
