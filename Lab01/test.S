// Test.S assembly test file, determine what this function is...

.globl test

test :
// make sure you replace Z with the first digit of your UIN

	LSR X1, X0, #8  //computation 1, result is in $X1
	LSL X2, X0, #8 //computation 2, result is in $X2

	// check the content of $X1 and $X2

	ADD X0, X1, X2
	BR X30 // return from main ; return address stored in X30

// Part 5--------------------------------------------------------

// // ARMv8 Assembly file containing "test" function.

// //Note that by default C passes the first two arguments to a function
// //call in registers X0 and X1 respectively.
//  

//  .globl test           // Defining the symbol "test" for the
//     // linker
// test:
// 	orr X0, XZR, #3
//  add X0, X0, #7      // Perform the actual addition
//  br X30

// Part 2--------------------------------------------------------

// // ARMv8 Assembly file containing "test" function.

// //Note that by default C passes the first two arguments to a function
// //call in registers X0 and X1 respectively.
	

// 	.globl test          	// Defining the symbol "test" for the
// 				// linker
// test:
// 	add	X0, X0, X1      // Perform the actual addition
// 	br	X30