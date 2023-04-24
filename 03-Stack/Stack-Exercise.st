!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:40:52'!
searchingThePrefix: aPrefix onStack: aStack shouldFailWithMessage: aMessageError
	
	^self
		should: [
			
			sentenceFinder findSentencesThatBeginsWith: aPrefix from: aStack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = aMessageError ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:38:39'!
test01EmptyStackReturnsNothing

	| stack result |
	
	stack := OOStack new.

	result := sentenceFinder findSentencesThatBeginsWith: 'Winter' from: stack.	
	self assert: result size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:09:03'!
test02CanNotFindEmptyPrefix

	| stack |
	
	stack := OOStack new.
	self searchingThePrefix: '' onStack: stack shouldFailWithMessage: (SentenceFinderByPrefix emptyPrefixErrorDescription).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:09:15'!
test03CanNotFindPrefixContainingWhitespace

	| stack |
	
	stack := OOStack new.
	self searchingThePrefix: 'a b' onStack: stack shouldFailWithMessage: (SentenceFinderByPrefix prefixContainsWhitespaceErrorDescription).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:39:08'!
test05FindOneSentenceOnTop

	|stack result|
	
	stack := OOStack new.
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	result := sentenceFinder findSentencesThatBeginsWith: 'Winter' from: stack.		
	self assert: result size = 1.
	self assert: (result at: 1) = 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:39:22'!
test06FindOneSentenceInTheMiddle

	|stack result|
	
	stack := OOStack new.
	
	stack push: 'winter is coming'.
	stack push: 'Winter is here'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
		
	result := sentenceFinder findSentencesThatBeginsWith: 'Winter' from: stack.	

	
	self assert: result size = 1.
	self assert: (result at: 1) = 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:39:29'!
test07FindOneSentenceOnTheBottom

	|stack result|
	
	stack := OOStack new.
	
	stack push: 'Winter is here'.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
		
	result := sentenceFinder findSentencesThatBeginsWith: 'Winter' from: stack.	
	
	self assert: result size = 1.
	self assert: (result at: 1) = 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:39:36'!
test08FindNoSentences
	|stack result|
	
	stack := OOStack new.
	
	stack push: 'winter is here'.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
		
	result := sentenceFinder findSentencesThatBeginsWith: 'Winter' from: stack.	
	
	self assert: result size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:50:11'!
test09FindSeveralSentences
	|stack result|
	
	stack := OOStack new.
	
	stack push: 'winter is here'.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'winter is not here'.
	stack push: 'qwerty'.
	stack push: 'La mitad + 1'.
	stack push: 'Blah Blah Blah'.
	stack push: 'winter winter'.
		
	result := sentenceFinder findSentencesThatBeginsWith: 'winter' from: stack.	
	
	self assert: result size = 4.
	self assert: (result at: 4) = 'winter winter'.
	self assert: (result at: 3) = 'winter is not here'.
	self assert: (result at: 2) = 'winter is coming'.
	self assert: (result at: 1) = 'winter is here'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Ms 4/24/2023 13:39:57'!
test10PreservesOriginalStack
	|stack|
	
	stack := OOStack new.
	
	stack push: 'winter is coming'.
	stack push: 'The winds of Winter'.
	
	sentenceFinder findSentencesThatBeginsWith: 'Winter' from: stack.	
	
	self assert: stack size = 2.
	self assert: stack pop = 'The winds of Winter'.
	self assert: stack pop = 'winter is coming'.
! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'TM 4/24/2023 11:12:38'!
setUp
	
	sentenceFinder := SentenceFinderByPrefix new.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'array state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'removing' stamp: 'Ms 4/23/2023 17:33:35'!
pop
	
	state popObject: self.
	^array removeLast.	! !


!OOStack methodsFor: 'adding' stamp: 'Ms 4/23/2023 17:02:08'!
push: anObject
	state pushAnObjetct: self.
	array addLast: anObject! !


!OOStack methodsFor: 'initialization' stamp: 'Ms 4/23/2023 16:59:37'!
initialize

	array := OrderedCollection new.
	state  := StackEmpty new. ! !


!OOStack methodsFor: 'accessing' stamp: 'Ms 4/23/2023 17:00:24'!
isEmpty

	^state isEmpty.! !

!OOStack methodsFor: 'accessing' stamp: 'vk 4/20/2023 21:31:13'!
size

	^array size	! !

!OOStack methodsFor: 'accessing' stamp: 'Ms 4/23/2023 17:39:31'!
top
	state errorStackEmpty.
	^array at: (array size)! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:04:34'!
setState: aState
	state := aState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'Ms 4/23/2023 17:46:18'!
emptyStackError
	^ self error: self stackEmptyErrorDescription.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'internal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Ms 4/24/2023 13:35:38'!
reconstructStack: aStack

	[internal isEmpty] whileFalse: [
		aStack push: internal pop.
	].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Ms 4/24/2023 13:47:29'!
selectSentencesWithPrefix: aPrefijo from: aStack
	| value array |
	array := OrderedCollection new.

	[aStack isEmpty] whileFalse: [ 
		value := aStack pop.
		internal push: value.
		(value beginsWith: aPrefijo) ifTrue: [array addFirst: value].
	].

^array

! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Ms 4/24/2023 13:50:48'!
verifyPrefix: aPrefijo 

	self verifyThatPrefixIsNotEmpty: aPrefijo.
	self verifyThatPrefixNotContainsSpace: aPrefijo.! !


!SentenceFinderByPrefix methodsFor: 'verification' stamp: 'Ms 4/24/2023 13:30:39'!
verifyThatPrefixIsNotEmpty: aPrefijo
	aPrefijo isEmpty ifTrue: [self error: self class emptyPrefixErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'verification' stamp: 'Ms 4/24/2023 13:31:25'!
verifyThatPrefixNotContainsSpace: aPrefijo
	(aPrefijo includesSubString: ' ') ifTrue: [self error: self class prefixContainsWhitespaceErrorDescription ].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'Ms 4/23/2023 17:59:28'!
initialize
	internal := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'Ms 4/24/2023 13:50:48'!
findSentencesThatBeginsWith: aPrefijo from: aStack

	|array |
	
	self verifyPrefix: aPrefijo.
	
	array := self selectSentencesWithPrefix: aPrefijo from: aStack.
	self reconstructStack: aStack.
	
	^array.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'Ms 4/23/2023 18:03:28'!
emptyPrefixErrorDescription
		
	^ 'Prefix is empty!!!!!!'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'TM 4/24/2023 11:15:46'!
prefixContainsWhitespaceErrorDescription
		
	^ 'Prefix contains whitespace!!!!!!'! !



!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:39:46'!
errorStackEmpty
	^self subclassResponsibility ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:05:08'!
isEmpty

	^self subclassResponsibility.! !

!StackState methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:28:11'!
popObject: anObject
	^self subclassResponsibility ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:25:04'!
pushAnObjetct: anObject

	anObject setState: (NotStackEmpty initilizeWithStatus: self).
	! !


!classDefinition: #NotStackEmpty category: 'Stack-Exercise'!
StackState subclass: #NotStackEmpty
	instanceVariableNames: 'previousState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotStackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:40:35'!
errorStackEmpty! !

!NotStackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:12:01'!
initializeWithPreviousState: aStackState
	
	previousState  := aStackState ! !

!NotStackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:05:17'!
isEmpty
	^false! !

!NotStackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:28:21'!
popObject: anObject
	anObject setState: previousState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotStackEmpty class' category: 'Stack-Exercise'!
NotStackEmpty class
	instanceVariableNames: ''!

!NotStackEmpty class methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:11:22'!
initilizeWithStatus: aState
	
	^self basicNew initializeWithPreviousState: aState ! !


!classDefinition: #StackEmpty category: 'Stack-Exercise'!
StackState subclass: #StackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:46:33'!
errorStackEmpty
	OOStack emptyStackError! !

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:05:24'!
isEmpty
	^true! !

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:46:39'!
popObject: anObject
	OOStack emptyStackError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackEmpty class' category: 'Stack-Exercise'!
StackEmpty class
	instanceVariableNames: ''!

!StackEmpty class methodsFor: 'as yet unclassified' stamp: 'Ms 4/23/2023 17:00:03'!
new
	^self basicNew initialize.! !
