Finding a Longest Increasing Subsequence in Six Languages
by O. Otcasek

This project consists of a single problem implemented in 6 languages. The problem is to find a longest strictly increasing subsequence of a list of integers given by the user. The 6 languages, in no particular order, are Ada, C#, Python, Ocaml, Prolog, and Java (for extra credit). Note that every implementation except for those in Prolog and Ocaml run in O(nlogn) time for extra credit. The implementations for Ocaml and Prolog unfortunately are doubly-recursive and run in exponential time. The reason for this is because the Ocaml implementation is purely functional, and thus includes no assignments or memory side-effects, and because of Prolog's declerative structure.

I have attempted to keep each implementation as close to each other as possible, without sacrificing efficiency or style. For example, all implementations (aside from Ocaml and Prolog) have the same variable names and work in the same manner. 

About the algorithms:
The doubly-recursive implementation is used for Ocaml and Prolog. I had not other choice for Ocaml. This works, in short, by traversing the input array recursively, and for each element, the program will construct and evaluate all different increasing subsequences and return one of the largest ones. Prolog's implementation defines a longest subsequence and an increasing subsequence and program will search for a fitting subsequence.


The O(nlogn) algorithm uses dynamic programming and a tail array instead of recursive transversals. Part of the idea for this algorithm (the tail list idea) came from a member of the first workshop I attended, but to be clear, absolutely no code was shown. The algorithm itereated through the input array and places each element in an appropriate place in the tail list, and uses a recovery list to map each element in the tail list to its optimal previous result. Then, it uses this mapping to reconstruct a longest increasing subsequence in descending order and reverses the list (it is backwards because of the way the recovery list is built).



How to run:

To run this project, the following files should be compiled: lis.adb, lis.java, lis.cs.
All other files (lis.py, lis.ml, and lis.pl) should be run in each language's respective interpreter.
see the compilation and interpreter instructions below.

Compilation instructions:

lis.adb -> use the unix command "gnatmake lis.adb" and run the result like this: "./lis". (Note, input lists must enf with the EOF character, "$").
lis.cs -> use "msc lis.cs" followed by "mono lis.exe". msc will create an executable to be run on mono.
lis.java -> use "javac lis.java" followed by "java lis".

Interpreter instructions
lis.py -> enter the Python interpreter and type "import lis". to run the function, type "lis.lis(<input>)" where <input> is a list typed as [1,2,3,...etc.] in the parentheses.

lis.pl -> load lis.pl into the Prolog interpreter by typing "[lis]". Then run by typing "lis(<input>, L).".

lis.ml -> load lis.ml into the Ocaml interpreter by typing "#use "lis.ml;;"" and "lis(<input>);;" where <intput> is formatted like the following: [1;2;3;...etc.].

Please do not use my work dishonestly.


