!classDefinition: #I category: 'PeanoCloning'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'PeanoCloning'!
I class
	instanceVariableNames: 'next prev'!

!I class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:34:50'!
* aNaturalNumber
	^aNaturalNumber.! !

!I class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:19:24'!
+ aNaturalNumber
	^aNaturalNumber next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:37:31'!
<= aNaturalNumber
	^True.! !

!I class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:18:59'!
next
	^next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:19:07'!
prev
	^prev.! !

!I class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:30:27'!
subtractFrom: aNaturalNumber
	^aNaturalNumber prev.! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.
	prev := nil.! !


!classDefinition: #II category: 'PeanoCloning'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'PeanoCloning'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:36:36'!
* aNaturalNumber
	^aNaturalNumber + (prev * aNaturalNumber).! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:32:59'!
+ aNaturalNumber
	^prev + aNaturalNumber next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:33:56'!
- aNaturalNumber
	^aNaturalNumber subtractFrom: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:47:13'!
/ aNaturalNumber
	((self + I - aNaturalNumber) <= aNaturalNumber)
	ifTrue: [^I.]
	ifFalse: [^I + ((self - aNaturalNumber) / aNaturalNumber).]! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:40:59'!
<= aNaturalNumber
	aNaturalNumber = I
	ifTrue: [^False.]
	ifFalse: [^prev <= aNaturalNumber prev.]! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:29:16'!
next
	next ifNil: [
		next := II createChildNamed: self name , 'I'.
		next prev: self.
	].
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:21:43'!
prev
	^prev.! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:22:22'!
prev: aNaturalNumber
	prev := aNaturalNumber.! !

!II class methodsFor: 'as yet unclassified' stamp: 'TM 4/3/2023 16:31:23'!
subtractFrom: aNaturalNumber
	^prev subtractFrom: aNaturalNumber prev.! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !


!classDefinition: #III category: 'PeanoCloning'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'PeanoCloning'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	prev := II.! !


!classDefinition: #IIII category: 'PeanoCloning'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'PeanoCloning'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	prev := III.! !


!classDefinition: #IIIII category: 'PeanoCloning'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'PeanoCloning'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	prev := IIII.! !


!classDefinition: #IIIIII category: 'PeanoCloning'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'PeanoCloning'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	prev := IIIII.! !


!classDefinition: #IIIIIII category: 'PeanoCloning'!
II subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'PeanoCloning'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	prev := IIIIII.! !


!classDefinition: #IIIIIIII category: 'PeanoCloning'!
II subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'PeanoCloning'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	prev := IIIIIII.! !


!classDefinition: #IIIIIIIII category: 'PeanoCloning'!
II subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: 'PeanoCloning'!
IIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIII.
	prev := IIIIIIII.! !


!classDefinition: #IIIIIIIIII category: 'PeanoCloning'!
II subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIII class' category: 'PeanoCloning'!
IIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIII.
	prev := IIIIIIIII.! !


!classDefinition: #IIIIIIIIIII category: 'PeanoCloning'!
II subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIII class' category: 'PeanoCloning'!
IIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIII.
	prev := IIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIII category: 'PeanoCloning'!
II subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PeanoCloning'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIII class' category: 'PeanoCloning'!
IIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIII class methodsFor: '--** private fileout/in **--' stamp: 'TM 4/3/2023 16:47:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := IIIIIIIIIII.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!
IIIIIIIIII initializeAfterFileIn!
IIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIII initializeAfterFileIn!