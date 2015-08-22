#!/usr/bin/env perl
###############################################################################
#
# Simple API for searching public keys from email
#
###############################################################################
use strict;
use warnings;
use Mojolicious::Lite;
use WWW::HKP;
use Mail::RFC822::Address qw(valid);

#  Setting HKP server
my $hkp = WWW::HKP->new(
        host => 'raxus.rnp.br',
        port => 11371
);

get '/mail/:mail' => sub {
	my $c = shift;

	#  Return bad request if mail is invalid
	if ( ! valid($c->param('mail')) ){
		$c->render(json => {result => 'error', message => 'Invalid mail.'}, status => 400);
		return;
	}

	#  -> Here email is valid

	#  Search in HKP server for avaliable public keys
	my $result = $hkp->query(index => $c->param('mail'));

	#  Structure to stora metadata from public keys
	my @keychain;

	#  If the query returns a HASH it is valid
	#    if it is undef, no keys were found
	if (ref($result) eq 'HASH') {

		#  Looking for unrevoked keys
		foreach my $key (keys %{$result}) {

			#  Add to keychain valid keys (unrevoked,unexpired,undeleted) 
			if ($result->{$key}->{ok}) {
				my $public_key = $hkp->query(get => $key);

				#  Regexp to only add public key
				if ($public_key =~ /(-----BEGIN PGP PUBLIC KEY BLOCK-----.*-----END PGP PUBLIC KEY BLOCK-----)/sm) {
					$result->{$key}->{public_key} = $1;
					$result->{$key}->{id} = $key;

					push @keychain,$result->{$key};
				}			
			}
		}

	} elsif (! defined $result ) {
		$c->render(json => {result => 'error', message => 'Key not found.'}, status => 404);
		return;
	} else {
		$c->render(json => {result => 'error', message => $hkp->error()}, status => 500);
		return;
	}

	$c->render(json => {result => 'success', data => \@keychain});
};

app->config(hypnotoad => {
	listen => [
		'http://*:8080'
		],
	clients => 1, # is a blocking API
	user => 'www-data',
	group => 'www-data',
});

app->log->level('debug');
app->start;
