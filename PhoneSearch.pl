#!/usr/bin/perl
#Timothy Dusek

#This program is a search program. It asks a user for a blackbook text file to open and then searches the file to the users specifications for matches either by number or by name.

use strict;

my($userInput, $searchedItem, $fileName, @array, $currentChar,$char,$ph, @returnedArray);

$searchedItem=".*";
$fileName = $ARGV[0];

if ($fileName eq ""){
	print "Please enter a file name including it's file extention.\n";
	chomp($fileName=<STDIN>);
}

print $fileName, "\n";

	open (INFILE, "<", $fileName) or die ("The file listed does not exist.\nThe program will now exit. Please re-open the program.\n");
	while (my $row = <INFILE>) {
		
	  push @array, $row;
}

print "Please input what you want to search for:\n";

chomp ($userInput=<STDIN>);

foreach $char (split //, $userInput) {
	$char=uc($char);
	if ($char eq "0"){
		$ph="[0].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "1"){
		$ph="[1].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "2"||$char eq  "A"||$char eq "B"||$char eq "C"){
		$ph="[2ABC].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "3"||$char eq  "D"||$char eq "E"||$char eq "F"){
		$ph="[3DEF].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "4"||$char eq  "G"||$char eq "H"||$char eq "I"){
		$ph="[4GHI].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "5"||$char eq  "J"||$char eq "K"||$char eq "L"){
		$ph="[5JKL].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "6"||$char eq  "M"||$char eq "N"||$char eq "O"){
		$ph="[6MNO].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "7"||$char eq  "P"||$char eq "Q"||$char eq "R"||$char eq "S"){
		$ph="[7PQRS].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "8"||$char eq  "T"||$char eq "U"||$char eq "V"){
		$ph="[8TUV].*";
		$searchedItem.=$ph;
	}
	
	if ($char eq "9"||$char eq  "W"||$char eq "X"||$char eq "Y"||$char eq "Z"){
		$ph="[9WXYZ].*";
		$searchedItem.=$ph;
	}
}

#print "$searchedItem\n";
print "Returned results:\n";

foreach my $item (@array) {
	my $contactName="";
	my $contactNumber="";
	my $flag=0;
	
	foreach $char (split //, $item) {
		if ($char eq ":"){
			$flag=1;
		}
		
		if ($flag==0){
			$contactName.=$char;
			
		}
		
		if ($flag==1 && $char ne ":"){
			$contactNumber.=$char;
		}
	}
	
	if ($contactName=~/$searchedItem/i || $contactNumber=~/$searchedItem/i){
		push @returnedArray, $item;
	}
	
}

#print @returnedArray,"\n";




foreach my $item (@returnedArray){
	my $contactName="";
	my $contactNumber="";
	my $flag=0;
	
	foreach $char (split //, $item) {
		if ($char eq ":"){
			$flag=1;
		}
		
		if ($flag==0){
			$contactName.=$char;
			
		}
		
		if ($flag==1 && $char ne ":"){
			$contactNumber.=$char;
		}
		
		
	}
	
	#printf "%-15s   %s", $contactName, $contactNumber;
	
	
	###
	
	my $numberLength=0;
	my $printedNum="";
	my $tempNum="";
	foreach $char (split //, $contactNumber) {
		if ($char=~/\d/){
			$numberLength=$numberLength+1;
			$tempNum.=$char;
		}
	}
	
	if ($numberLength==7){
		$printedNum.="1-701-";
		$printedNum.=substr($tempNum, 0, 3);
		$printedNum.="-";
		$printedNum.=substr($tempNum, 3, 4);
	}
	
	if ($numberLength==10){
		$printedNum.="1-";
		$printedNum.=substr($tempNum, 0, 3);
		$printedNum.="-";
		$printedNum.=substr($tempNum, 3, 3);
		$printedNum.="-";
		$printedNum.=substr($tempNum, 6, 4);
	}
	
	if ($numberLength==11){
		$printedNum.=substr($tempNum, 0, 1);
		$printedNum.="-";
		$printedNum.=substr($tempNum, 1, 3);
		$printedNum.="-";
		$printedNum.=substr($tempNum, 4, 3);
		$printedNum.="-";
		$printedNum.=substr($tempNum, 7, 4);
	}
	
	printf "%-15s   %5s\n", $contactName, $printedNum;
	
}







close INFILE;