This program, written in Perl, takes a text file which is specified via the user at runtime and searches is for names or phone numbers.
It then returns all names and numbers in which it matched.

You can serch directly by name and phone number however it will search as if typed on a feature phone's keypad.
This means 2 = A = B = C, 3 = D = E = F, etc.

So to search for "carl" you could type in 2275 which may return more than 1 thing such as a phone number with 2275 in it sequentially.

The text file which gets searched may or may not include area code, parethesis, or hyphens. It must include 7, 10, or 11 digits.

This program was created to help test my understanding of regex.
