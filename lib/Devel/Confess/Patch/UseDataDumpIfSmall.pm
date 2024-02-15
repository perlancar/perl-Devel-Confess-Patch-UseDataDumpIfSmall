package Devel::Confess::Patch::UseDataDumpIfSmall;

use 5.010001;
use strict;
no warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

use Module::Patch;
use base qw(Module::Patch);

our %config;

sub patch_data {
    return {
        v => 3,
        config => {
        },
        patches => [
            {
                action      => 'replace',
                #mod_version => qr/^/,
                sub_name    => '_ref_formatter',
                code        => sub {
                    require Data::Dump::IfSmall;

                    #local $SIG{__WARN__} = sub {};
                    #local $SIG{__DIE__} = sub {};
                    Data::Dump::IfSmall::dump($_[0]);
                },
            },
        ],
   };
}

1;
# ABSTRACT: Use Data::Dump::IfSmall format refs

=for Pod::Coverage ^()$

=head1 SYNOPSIS

 % PERL_DATA_DUMP_IFSMALL_MAX_SIZE=2048 PERL5OPT=-MDevel::Confess::Patch::UseDataDumpIfSmall  -MDevel::Confess=dump yourscript.pl


=head1 DESCRIPTION


=head1 SEE ALSO

L<Data::Dump::IfSmall>
