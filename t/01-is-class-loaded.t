use Test::More;

use Class::Load::Tiny qw(is_class_loaded);

use lib 't/lib';

use strict;
use warnings;

ok(is_class_loaded("Class::Load::Tiny"));
ok(is_class_loaded("Test::More"));

ok(!is_class_loaded("Some::Random::Module"));

done_testing;
