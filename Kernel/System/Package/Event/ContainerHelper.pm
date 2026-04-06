# --
# Copyright (C) 2012 Znuny GmbH, https://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Package::Event::ContainerHelper;

use strict;
use warnings;
use utf8;

use File::Path qw(make_path);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Main',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(Data Event Config)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    my $Directory = '/persistent';

    if ( !-d $Directory ) {
        if ( !make_path($Directory) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Could not create directory '$Directory': $!",
            );
            return;
        }
    }

    my $Content = '';

    FILE:
    for my $File (qw(restart-daemon restart-httpd)) {
        my $FileLocation = $MainObject->FileWrite(
            Directory  => $Directory,
            Filename   => $File,
            Content    => \$Content,
            Permission => '664',
        );
        next FILE if $FileLocation;

        $LogObject->Log(
            Priority => 'error',
            Message  => "Could not create file '$Directory/$File'!",
        );
    }

    return 1;
}

1;
