use Test::More;
use Test::Exception;

use Class::Load::Tiny qw(load_class is_class_loaded);

use lib 't/lib';

use strict;
use warnings;

lives_ok(sub { load_class("Load::Me::Ok") });
ok(is_class_loaded("Load::Me::Ok"));

throws_ok(sub { load_class("Load::Me:::Missing") }, qr{^Invalid class name});
throws_ok(sub { load_class("1Load::Me::Missing") }, qr{^Invalid class name});
throws_ok(sub { load_class("Load::..::Me") }, qr{^Invalid class name});
throws_ok(sub { load_class("Load::Me.pm") }, qr{^Invalid class name});
throws_ok(sub { load_class("::Load::Me") }, qr{^Invalid class name});

done_testing;
