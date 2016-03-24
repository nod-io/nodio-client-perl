#-*-cperl-*-

use lib qw(../lib lib);

use Test::More;
use JSON;
use  NodIO::Client;
use Test::HTTP::Server;
  
my $server = Test::HTTP::Server->new();

my $get_response = { chromosome => "101010101010" };
my $put_response = {  chromosome=> "010101010102",
		      length => 1,
		      updated => 'TRUE' };

sub Test::HTTP::Server::Request::random {
  my $self = shift;
  return JSON->encode( $get_response );
}

sub Test::HTTP::Server::Request::one {
  my $self = shift;
  return JSON->encode( );
}

my $nc = new NodIO::Client;

is( ref $nc, "NodIO::Client", "Object");

$nc = new NodIO::Client( $server->uri );

is( ref $nc, "NodIO::Client", "Object with URL");

done_testing();
