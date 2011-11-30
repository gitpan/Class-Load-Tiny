use Test::More;

use Class::Load::Tiny qw(try_load_class is_class_loaded);

use lib 't/lib';

use strict;
use warnings;

{
	my ($check, $err) = try_load_class("Load::Me::Ok");
	ok($check);
	is($err, undef);
	ok(is_class_loaded("Load::Me::Ok"));
}

{
	my ($check, $err) = try_load_class("Load::Me::Missing");
	ok(!$check);
	like($err, qr{^Can't locate Load/Me/Missing.pm in \@INC});
	ok(!is_class_loaded("Load::Me::Missing"));
}

{
	my ($check, $err) = try_load_class("Load::Me::Err");
	ok(!$check);
	like($err, qr{^Missing right curly or square bracket at});
	ok(!is_class_loaded("Load::Me::Err"));
}

done_testing;
