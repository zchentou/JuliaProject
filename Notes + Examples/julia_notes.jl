#Don’t use Nervous Beginners, for those who don’t know programming already

# 7. Notes from freecodecamp:

# BEGIN

# Variables- dynamically typed
# typeof(x)
# Can have emoji variable names
# \sigma etc. for mathematical ideas

# if (cond) encouraged but if cond works
# uses if else end format, similar to Jinka template, not{}
# similar for for/while

# mutable arrays

# arguments- because variables dynamic... not static (unless specified with user_name::String for eg)

# Multiple Dispatch- build either generic or type specific versions of functions, allowed to deinfe functions with same name and number of arguments, but that accept different types (one function with same name can be defined multiple times... much more flexible)
# methods(function_name)- will tells us what methods/functions are actually defined
# returning in Julia, can use explicit return keyword or have last expression be return value (no functions don't have return value
# better to use return keyword for readibility
# also: julia has option to provide optional arguments with arg=..., exactly like Python (with default value then)

# packages in Julia
# interact with REPL or Pkg package
# enter package manager with ] from REPL- looks similar to Python virtual environment
# Add a package (with add PACKAGE_NAME)
# Remove a package (with rm PACKAGE_NAME) (rm shorthand for remove, can also use remove)
# Check what is already installed (st)- lists all packages downloaded
# can see comands with ?

# to use package: using PACKAGE_NAME, can then say y to add if don't have
# versus import PACKAGE_NAME (analogous to Python import FILE vs import * from FILE, or importing all functions individually)
# if import- do PACKAGE_NAME.function_name()

# OOP in Julia
# does not have paradigm like classes, can use structs (like C++ structs)
# attributes- can be static / explicit types, or not
# default ctor vs explicit
# can have specific getters and setters too (just won't be inside class, struct passed as object, like in C++)
# unlike C++ struct however, don't use -> (meaning *(object_name)., because object_name is actually pointer in memory to object and needs to be dereferenced first and then have its attribute accessed) to access attribute, use object_name.atribute_name 
# example in freecodecamp: as seen, if no function as part of Multple Dispatch matches the type of object we are passing as argument, then will error out
# unlike C++, by default, struct is immutable (put mutable keyword to allow attribute values to be changed after intialization with constructor)
# new custom type of object is now available, the type be defined when we created struct

# DONE

# 2. discourse.julialang.org as stackoverflow equivalent for Julia

# 1. Manual Pages under Julia

#  BEGIN

# Look at gaps that were not covered in freecodecamp:
# Variables
# variables are case sensitive
# could redefine built-in constants + functions, not recommended though (except if being used in program)
# cannot redefine keywords
# idenitfiers with only underscores can be assigned values but cannot be used to assign values to other vars—they are to be used as L-values (have addresses in memory) (R-values- only temporary value, does not stay in memory after use)

# Integers and Floating-Point Numbers
# Built-in representations, as binary encodings = numeric primitives (EECS 370 binary encodings, like memory addresses etc., used to store all values)
# Representations of values in code = integer literal, floating-point literal
# Similar int and floating-point types with different # of bits to use in different ways for different purposes
# Complex and rational #s allowed
# Default type of int literal- 32-bit vs 64-bit, depends on system architecture, chip (EECS 370 again, depends on hardware) (access with Sys.WORD_SIZE) (will switch to 64-bit if needed, if 32 bits aren't enough- check with typeof(INTLITERAL))
# Unsigned Ints, like in C/C++, can use hexadecimal for base-16 (similar for binary, octal etc.)
# typemin(primitimve_numeric_type like Int32)- gives min literal value for this, same with typemax(...)
# overflow- wraps around, like in C/C++ (because of binary representation making leading bit a 1 and switching sign, MSB- most significant bit, EECS 370)
# if don't want overflow, can use BigInt type from Arbitraty Precision Arithemtic
# DivideEroor- if lowest negative number divided by -1 (again because of structure of bits) and divided by zero (clearly)
# E notation used for decimals (f uses Float32 instead of Float64)
# 0.0 == -0.0, but different bitstrings
# Inf values and NaN similar to C++

# DONE

# 9. Video on Multiple Dispatch- The Unreasonable Effectiveness of Multiple Dispatch

# BEGIN

# Multiple Dispatch- key paradigm
# Julia's ecosystem- even with other high level dynamic languages, OOP languages, because of Multiple Dispatch (allows different types, dynamic type)
# DifferentialEquations- composability + generic, creates error bars
# Multiple Dispatch- good for generic algs that will work for a lot of different data (functional overloading in C++ from EECS 280 doesn't work like this...)
# 2 Types of code reuse- generic algs, common types (like using different algs with same structs)
# These are different with different explanations, different aspects of MD
# Prelude- Functional Overloading (in C++, Java)- looks similar
# Cats + Dogs example with abstract type Pet, use struct for Dog, for Cat, do something during encounter, print action, the verb
# Print the encounters example
# Now translate this Julia into C++- uses Pet class (advantage- abstract, can still have name field, attribute, in here)
# Define 2 subtypes Dog, Cat (don't need field name now), then define meets methods that are actually overloaded function calls (with Dog subtype passed into Pet instance argument)
# Julia- works as expected, but C++ just defaults to regular function (b/c of this generic code... uses functional overload, looks at static type of a and static type of b, like we saw in EECS 280, static type because of Pet, decided at COMPILE TIME not RUNTIME- here we need the type before, functional overloading is not nearly as flexible) 
# reminder of functional overloading- polymorphism, can be used for different types of parameters in function declaration, different numbers of parameters in function declaration, C++ will match to right one. It 
# EECS 280- checking name lookup order- 

# The compiler starts by looking for a member with that name in the compile-time or static type of the object. 

# If no member with that name is found, the compiler repeats the process on the base class of the given type. If the type has no base class, a compiler error is generated.

# If a member with the given name is found, the compiler then checks whether or not the member is accessible and whether the member can be used in the given context. 2 If not, a compiler error is generated – the lookup process does not proceed further.
# This is the problem. Because the function meets here is not a class function, cannot be made virtual etc. By default, static binding, function not virtual, so uses static binding, and we get the default behavior and not our overloaded function.
# Templates better... but still static

# Levels of dispatch-
# Programming levels with none- like C++, calls f if has f, constant expressive order and power
# Programming levels with single dispatch- write x1 dot f(x2...), now dispatch on x1, expressive power is linear, epressive order is O(of the things X could take in, size of set)
# Programming levels with multiple dispatches- f(x1, x2...). now dispatch on any variable, expressive power is exponential, expressive order is O(dispatch into any of the variables, technically product of all sizes of sets... but really better because can have flexibility on variable you can dispatch on)

# Generic Code for dispatch:
# inner product, using dot product, linear algebra (easy to see inner_sum calculated)
# Works easily
# Generic code, arbitraly efficient meaning that for dense vectors if will do good normal efficiency... but can be better for static arrays (unrolled + inlined)
# Can use that good code for anything, will work for new types (like one-hot vector, with single 1 and all other 0s, useful for ML)- easy to define, index of not 0 + length
# ... but with generic fallbacks, not specialized to the one-hot vector, not great efficiency (because of single 1, one-hot vector is really just picking a column)
# ...but with one-hot-vectors v and w, sclar indexing of A, define new method dif and then specialized!
# sometimes slower-than-optimal fallbacks cannot be patched so easily, can also use multiple dispatch to fill missing functionality easily because dynamically binded

# Single Dispatch Language: complicated, would need to also dispatch on multiple args for example, no good solution here! 

# Common Types (a lot of code reuse here):
# Example: Suppose have RGB Type, someone else wants to use that RGB type but add operations, like color vector spaces as example
# Julia- add methods to RGB in own code, no problem, words for existing + new operations
# ...so simple! C++ and other class-based object-oriented languages. methods go inside class, methods defined textually inside class... so to add method need to either inherit from class and put methods or edit original class (would need permission) (everyone would have to edit class, class becomes unreadable) (could not undo adding methods, others may use it)
# working with own RGB by inheriting will be annoying, won't work with others' RGB objects, if wanted to use others' people extensions, other inheritances, would have to inherit multiple times... which might not even be allowed
# could give up on dispatch or don't code share (no code reuse now, harder with other languages than Julia)

# Why does this work in Julia?
# defining methods on types after type is defined (don't have to go into class b/c don't have class!, have struct, methods defined after types are)
# can be done in separate package
# namespaces less organized... but only slight disadvantage
# now- with code reuse, generic functions are actually namespaces, won't get confused like public function in class (my fucntion and your function come from different extensions or packages)

# Coda- Expression Problem
# Observed problem in programming languages in 70s
# Extending data model and set of virtual operations without modifying existing code, repeating code, or runtime type errors (like C++ virtual functions can cause, dynamic binding- EECS 280)
# can you easily define new types and apply existing operations (easy for object-oriented languages, hard for functional ones), and define new operations applying to existing types (easy for functional languages, hard for object-oriented ones)
# Multiple Dispatch makes both easy!!! (add new generic functions or new types- means code reuse easier to use)

# Julia main advantages:
# Code reuse and code sharing
# generic algs apply to many different types (methods selected based on all argument types)
# common types shared by very different packages (methods can be added after types defined)

# Ideas for project:
# Illustrate advantages of multiple dispatch in other situations (combine with beginner projects maybe?)

# DONE

# 9. article on MD:
# Julia- subtyping abstract type only, use "supertype" PokeType (define subtype with <:)
# advantage with the poketypes, use T1 and T2 to catch all possbile permutations (for these 9 poketypes, would otherwise have 81 possible functions necessary for the combinations)
# then, doing all combinations + corner cases, only need to implement 30 functions
# better than statically generating bound methods to operate on during run time (like in C++, Java by default)- for example, if Pokemnon class contains PokeType object... will look at PokeType function, not our extension, statically bound to PokeType
# this advantage shows the benefit of generic algs
# MD- also allows better composition, because methods defined after container! (like in video, better for common types)
