use strict;
use Test::More tests => 1;
use Template;

my $tt = Template->new;

$tt->process(\<<EOF, {}, \my $out) or die $tt->error;
[% USE Hatena -%]
[% FILTER hatena sectionanchor => '\@' -%]
* Hello

-a
-b
--c
---d

[%- END %]
EOF

like $out, qr!<h3>.*?\<span class="sanchor">@</span>.*?Hello</h3>.*?<ul>.*?</ul>!s, $out;
