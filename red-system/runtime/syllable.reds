Red/System [
	Title:   "Red/System Syllable runtime"
	Author:  "Nenad Rakocevic"
	File: 	 %syllable.reds
	Rights:  "Copyright (C) 2011 Nenad Rakocevic. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/dockimbel/Red/blob/master/red-system/runtime/BSL-License.txt
	}
]

#define OS_TYPE		3

#define SA_SIGINFO   00000004h				;-- POSIX value?
#define SA_RESTART   10000000h				;-- POSIX value?

#syscall [
	write: 4 [
		fd		[integer!]
		buffer	[c-string!]
		count	[integer!]
		return: [integer!]
	]
]

#if use-natives? = yes [
	#syscall [
		quit: 6 [							;-- "exit" syscall
			status	[integer!]
		]
	]
]

***-on-start: func [/local c argv][
	argv: system/args-list
	c: 0

	while [argv/item <> null][
		c: c + 1
		argv: argv + 1
	]
	
	system/args-count: c
]

#include %POSIX.reds
