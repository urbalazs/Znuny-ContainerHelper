# --
# Copyright (C) 2012 Znuny GmbH, https://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ZnunyContainerHelper;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # SysConfig
    $Self->{Translation}->{'Package event module to trigger the web server and daemon restart.'} =
        'Paket-Ereignismodul zum Auslösen des Neustarts von Webserver und Daemon.';


    push @{ $Self->{JavaScriptStrings} //= [] }, (
    );

}

1;
