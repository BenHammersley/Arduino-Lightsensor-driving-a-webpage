#!/usr/bin/perl

=begin lip

=head1 Listen to Arduino sensor and write the page

untitled

=head1 DESCRIPTION



//  Created by Ben Hammersley on 2009-04-05.

=cut

=item



=cut

use strict;
use warnings;
use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);

open FILE, ">state.txt";

print FILE "Light";

close FILE;


=end lip
=cut
