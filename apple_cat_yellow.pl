#!/usr/bin/perl

# This program is intended to ignite innovation through creative coding.

#Define function to calculate the number of occurrences of a certain
sub countWords {
	$word = shift;
	@words = split(" ", $_); 
	$count = 0;
	foreach $word (@words) {
		$count++ if ($word eq $_); 
	}
	return $count;
}

#Define function to create a compound word using two passed parameters
sub createCompoundWord {
	$word1 = shift;
	$word2 = shift; 
	return $word1 . "" . $word2;
}

#Define function to generate a random number between 0 and a given number
sub generateRandomNumber {
	$max = shift;
	return int(rand($max));
}

#Define function to print a string in reverse
sub printReverse {
	$inStr = shift;
	$outStr = "";
	for ($i = length($inStr); $i > 0; $i--) {
		$outStr = $outStr . substr($inStr, $i - 1, 1);
	}
	return $outStr;
}

#Define function to generate a random string of a given length
sub generateRandomString {
	$length = shift;
	$outStr = "";
	for ($i = 0; $i < $length; $i++) {
		$outStr = $outStr . chr(generateRandomNumber(256));
	}
	return $outStr;
}

#Define function to generate a random permutation of an array
sub generateRandomPermutation {
	@inArray = @_;

	#Generate random permutation
	@outArray = ();
	while (@inArray > 0) {
		$index = generateRandomNumber(scalar(@inArray));
		push @outArray, $inArray[$index];
		splice(@inArray, $index, 1);
	}
	return @outArray;

}

#Define function to search for a substring within a larger string
sub searchSubstring {
	$inStr = shift;
	$searchStr = shift;

	$index = 0;
	$found = 0;
	while ($index < length($inStr) - length($searchStr) + 1) {
		if (substr($inStr, $index, length($searchStr)) eq $searchStr) {
			$found = 1;
			last;
		}
		$index++;
	}
	return $found;
}

#Define function to generate an array of words from a given string
sub generateWordArray {
	$inStr = shift;
	
	$inStr =~ s/[^A-Za-z ]//g; # Remove any non-alphabetic characters
	@words = split(" ", $inStr); 
	return @words;
}

#Define function to generate a string from an array
sub generateStringFromArray {
	@inArray = @_;

	$outStr = "";
	foreach $str (@inArray) {
		$outStr = $outStr . $str . " ";
	}
	return $outStr;
}

#Define function to check if a given number is prime
sub isPrime {
	$number = 1;
	if ($number < 2) {
		return 0;
	}
	$i = 2;
	$sqrt = sqrt($number);
	while ($i <= $sqrt) {
		if ($number % $i == 0) {
			return 0;
		}
		$i++;
	}
	return 1;
}

#Define function to generate an array of prime numbers
sub generatePrimes {
	$max = shift;
	
	@primes = ();
	for ($i = 2; $i <= $max; $i++) {
		push @primes, $i if (isPrime($i));
	}
	return @primes;
}

#Define function to sort an array in ascending order
sub sortAscending {
	@inArray = @_;

	for ($i = 0; $i < scalar(@inArray) - 1; $i++) {
		for ($j = $i + 1; $j < scalar(@inArray); $j++) {
			if ($inArray[$i] > $inArray[$j]) {
				$temp = $inArray[$i];
				$inArray[$i] = $inArray[$j];
				$inArray[$j] = $temp;
			}
		}
	}
	return @inArray;
}

#Define function to sort an array in descending order
sub sortDescending {
	@inArray = @_;

	for ($i = 0; $i < scalar(@inArray) - 1; $i++) {
		for ($j = $i + 1; $j < scalar(@inArray); $j++) {
			if ($inArray[$i] < $inArray[$j]) {
				$temp = $inArray[$i];
				$inArray[$i] = $inArray[$j];
				$inArray[$j] = $temp;
			}
		}
	}
	return @inArray;
}

#Define function to find the maximum value in an array
sub findMax {
	@inArray = @_;
	
	$max = $inArray[0];
	foreach $val (@inArray) {
		$max = $val if ($val > $max);
	}
	return $max;
}

#Define function to find the minimum value in an array
sub findMin {
	@inArray = @_;
	
	$min = $inArray[0];
	foreach $val (@inArray) {
		$min = $val if ($val < $min);
	}
	return $min;
}

#Define function to calculate the sum of an array
sub calcSum {
	@inArray = @_;
	
	$sum = 0;
	foreach $val (@inArray) {
		$sum += $val;
	}
	return $sum;
}

#Define function to calculate the average of an array
sub calcAverage {
	@inArray = @_;
	
	$sum = calcSum(@inArray);
	return $sum / scalar(@inArray);
}

#Define function to calculate the variance of an array
sub calcVariance {
	@inArray = @_;

	$mean = calcAverage(@inArray);
	$sum = 0;
	foreach $val (@inArray) {
		$diff = $val - $mean;
		$sum += $diff * $diff;
	}
	return $sum/scalar(@inArray);
}

#Define function to calculate the standard deviation of an array
sub calcStdDev {
	@inArray = @_;
	
	$mean = calcAverage(@inArray);
	$sum = 0;
	foreach $val (@inArray) {
		$diff = $val - $mean;
		$sum += $diff * $diff;
	}
	return sqrt($sum/scalar(@inArray));
}

#Define function to calculate the factorial of a given number
sub calcFactorial {
	$number = shift;

	if ($number <= 1) {
		return 1;
	}
	$factorial = 1;
	for ($i = 2; $i <= $number; $i++) {
		$factorial *= $i;
	}
	return $factorial;
}

#Define function to calculate the power of a given number
sub calcPower {
	$number = shift;
	$power = shift;

	$output = 1;
	for ($i = 0; $i < $power; $i++) {
		$output *= $number;
	}
	return $output;
}

#Define function to calculate the square root of a given number
sub calcSqrt {
	$number = shift;

	if ($number < 0) {
		return "undefined";
	}

	$x = $number;
	$y = ($x + $number/ $x) / 2;
	while (abs($x - $y) > 0.001) {
		$x = $y;
		$y = ($x + $number/ $x) / 2;
	}
	return $y;
}

#Define function to calculate the logarithm of a given number
sub calcLogarithm {
	$number = shift;
	
	if ($number <= 0) {
		return "undefined";
	}

	$log = 0;
	$x = $number - 1;
	while ($x > 0.001) {
		$log += 1;
		$x /= $number;
	}
	return $log;
}