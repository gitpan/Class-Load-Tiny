use Test::More;
use Test::Exception;

use Class::Load::Tiny qw(load_class is_class_loaded);

use lib 't/lib';

use strict;
use warnings;

lives_ok(sub { load_class("Load::Me::Ok") });
ok(is_class_loaded("Load::Me::Ok"));

throws_ok(sub { load_class("Load::Me::Missing") }, qr{^Can't locate Load/Me/Missing.pm in \@INC});
ok(!is_class_loaded("Load::Me::Missing"));

throws_ok(sub { load_class("Load::Me::Err") }, qr{^Missing right curly or square bracket at});
ok(!is_class_loaded("Load::Me::Missing"));

done_testing;
