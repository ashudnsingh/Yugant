use strict;

my $fileName = "metadata.dat";

open(IN , "<:encoding(utf-8)" , "$fileName") or die ("Not able to read input file\n$!");

open(OUT, ">:encoding(utf-8)" , "$fileName".".new") or die ("Not able to create output file\n $!");

while(<IN>) {
	chomp $_;
	$_ =~s/^\x{fe}|\x{fe}$//g;
	my @data = split(/\x{fe}\x{14}\x{fe}/,$_);
	$data[4] =~s/(.+)\s(\..+$)/$1$2/;
	print OUT "\x{fe}" . join ("\x{fe}\x{14}\x{fe}",@data) . "\x{fe}" . "\n";
}
close IN;
close OUT;
