!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo negativeOneHalf'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'setup' stamp: 'MS 4/17/2023 21:42:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := Fraccion with: one over: two.
	oneFifth := Fraccion with: one over: five.
	twoFifth := Fraccion with: two over: five.
	twoTwentyfifth := Fraccion with: two over: (Entero with: 25).
	fiveHalfs := Fraccion with: five over: two.
	negativeOneHalf := Fraccion with: negativeOne over: two. 
	! !


!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 23:05:07'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 23:05:17'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2020 02:51:13'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 23:05:37'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 23:05:42'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'initialization' stamp: 'NR 9/8/2019 22:32:50'!
initializeWith: aValue
	
	value := aValue! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:44:35'!
* aMultiplier 
	^aMultiplier multiToEntero: self.
"
	(aMultiplier isKindOf: self class) ifTrue: [^self class with: value * aMultiplier integerValue].
	(aMultiplier isKindOf: Fraccion ) ifTrue: [^self * aMultiplier numerator / aMultiplier denominator ].
	
	self invalidNumberType 
"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:21:49'!
+ anAdder
	^anAdder addToEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:49:20'!
- aSubtrahend 
	^aSubtrahend subToEntero: self.
	
	"(aSubtrahend isKindOf: self class) ifTrue: [^self class with: value - aSubtrahend integerValue].
	(aSubtrahend isKindOf: Fraccion ) ifTrue: [^self * aSubtrahend denominator - aSubtrahend numerator / aSubtrahend denominator].
	
	self invalidNumberType "! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:12:39'!
/ aDivisor 
	^aDivisor divToEntero: self.
	
	"(aDivisor isKindOf: self class) ifTrue: [^Fraccion with: self over: aDivisor].
	(aDivisor isKindOf: Fraccion ) ifTrue: [^self * aDivisor denominator  / aDivisor numerator ].
	
	self invalidNumberType"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:27:52'!
addToEntero:	 anEntero
          ^self class with: value + anEntero integerValue

! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 11:47:14'!
addToFraccion: aFraccion
    ^(self * aFraccion denominator + aFraccion numerator) / aFraccion denominator
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:46:40'!
divToEntero: aEntero
	^Fraccion with: aEntero over: self 	
	
	"(aDivisor isKindOf: self class) ifTrue: [^Fraccion with: self over: aDivisor].
	(aDivisor isKindOf: Fraccion ) ifTrue: [^self * aDivisor denominator  / aDivisor numerator ].
	
	self invalidNumberType"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:37:45'!
divToFraccion: aEntero
	^aEntero numerator / (self * aEntero denominator).
	
	"(aDivisor isKindOf: self class) ifTrue: [^Fraccion with: self over: aDivisor].
	(aDivisor isKindOf: Fraccion ) ifTrue: [^self * aDivisor denominator  / aDivisor numerator ].
	
	self invalidNumberType"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:50:11'!
fibonacci

	self subclassResponsibility 
	
	"
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
	"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:48:11'!
multiToEntero: aEntero
	^self class with: value * aEntero integerValue
"
	(aMultiplier isKindOf: self class) ifTrue: [^self class with: value * aMultiplier integerValue].
	(aMultiplier isKindOf: Fraccion ) ifTrue: [^self * aMultiplier numerator / aMultiplier denominator ].
	
	self invalidNumberType 
"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:48:21'!
multiToFraccion: aFraccion
	^self * aFraccion numerator / aFraccion denominator
"
	(aMultiplier isKindOf: self class) ifTrue: [^self class with: value * aMultiplier integerValue].
	(aMultiplier isKindOf: Fraccion ) ifTrue: [^self * aMultiplier numerator / aMultiplier denominator ].
	
	self invalidNumberType 
"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:59:18'!
subToEntero: aEntero
	^self class with: aEntero integerValue	 - value
	"(aSubtrahend isKindOf: self class) ifTrue: [^self class with: value - aSubtrahend integerValue].
	(aSubtrahend isKindOf: Fraccion ) ifTrue: [^self * aSubtrahend denominator - aSubtrahend numerator / aSubtrahend denominator].
	
	self invalidNumberType "! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:03:47'!
subToFraccion: aFraccion
	^aFraccion numerator - (self * aFraccion denominator) / aFraccion denominator	
	
	"(aSubtrahend isKindOf: self class) ifTrue: [^self class with: value - aSubtrahend integerValue].
	(aSubtrahend isKindOf: Fraccion ) ifTrue: [^self * aSubtrahend denominator - aSubtrahend numerator / aSubtrahend denominator].
	
	self invalidNumberType "! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'TM 4/20/2023 12:51:12'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue < 0 ifTrue: [^Negativo new initializeWith: aValue].
	aValue = 0 ifTrue: [^Cero new initialize].
	aValue = 1 ifTrue: [^Uno new initialize].
	aValue > 1 ifTrue: [^PositivoMayorAUno new initializeWith: aValue].
	
	self error: Numero invalidNumberTypeErrorDescription ! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:59:10'!
fibonacci

	^Entero with: 1.! !


!Cero methodsFor: 'testing' stamp: 'TM 4/20/2023 12:39:08'!
isNegative
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'TM 4/20/2023 12:38:50'!
isOne
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'TM 4/20/2023 12:39:02'!
isZero
	
	^true! !


!Cero methodsFor: 'initialization' stamp: 'TM 4/20/2023 12:52:18'!
initialize

	value := 0! !


!classDefinition: #Negativo category: 'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:59:23'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!Negativo methodsFor: 'testing' stamp: 'TM 4/20/2023 12:39:15'!
isNegative
	
	^true! !

!Negativo methodsFor: 'testing' stamp: 'TM 4/20/2023 12:39:20'!
isOne
	
	^false! !

!Negativo methodsFor: 'testing' stamp: 'TM 4/20/2023 12:39:25'!
isZero
	
	^false! !


!classDefinition: #Positivo category: 'Numero-Exercise'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Positivo methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:49:06'!
fibonacci
	self subclassResponsibility ! !


!Positivo methodsFor: 'testing' stamp: 'TM 4/20/2023 12:40:00'!
isNegative
	
	^false! !

!Positivo methodsFor: 'testing' stamp: 'TM 4/20/2023 12:40:11'!
isZero
	
	^false! !


!classDefinition: #PositivoMayorAUno category: 'Numero-Exercise'!
Positivo subclass: #PositivoMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!PositivoMayorAUno methodsFor: 'testing' stamp: 'TM 4/20/2023 12:45:59'!
isOne
	
	^false! !


!PositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:46:09'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Positivo subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:46:54'!
fibonacci
	
	^self.! !


!Uno methodsFor: 'testing' stamp: 'TM 4/20/2023 12:46:40'!
isOne
	
	^true! !


!Uno methodsFor: 'initialization' stamp: 'TM 4/20/2023 12:54:44'!
initialize

	value := 1! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:46:11'!
* aMultiplier 
	^aMultiplier multiToFraccion: self.
	"
	(aMultiplier isKindOf: self class) ifTrue: [^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)].
	(aMultiplier isKindOf: Entero) ifTrue: [^aMultiplier * numerator / denominator ].

	self invalidNumberType 
	"! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 12:01:39'!
+ anAdder 
	^anAdder addToFraccion: self.
	"| newNumerator newDenominator |
	
	(anAdder isKindOf: self class) ifTrue: [
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		newDenominator := denominator * anAdder denominator.
		^newNumerator / newDenominator 
		].
	(anAdder isKindOf: Entero ) ifTrue: [^((anAdder * denominator) + numerator) / denominator ].

	self invalidNumberType "! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:02:37'!
- aSubtrahend 
	^aSubtrahend subToFraccion: self.
	"
	| newNumerator newDenominator |
	
	(aSubtrahend isKindOf: self class) ifTrue: [
		newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
		newDenominator := denominator * aSubtrahend denominator.
		^newNumerator / newDenominator 
	].
	(aSubtrahend isKindOf: Entero ) ifTrue: [^(numerator - (aSubtrahend * denominator )) / denominator].

	self invalidNumberType "
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:12:11'!
/ aDivisor 
	^aDivisor divToFraccion: self.
	
	"(aDivisor isKindOf: self class) ifTrue: [^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)].
	(aDivisor isKindOf: Entero) ifTrue: [^numerator  / (aDivisor * denominator )].

	self invalidNumberType"
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:42:17'!
addToEntero: anEntero
    ^(anEntero * denominator ) + numerator  / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 13:07:17'!
addToFraccion: aFraccion
    | newNumerator newDenominator |
    newNumerator :=  (denominator * aFraccion numerator) + (numerator * aFraccion denominator).
    newDenominator := denominator * aFraccion denominator.
    ^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 11:52:56'!
divToEntero: anEntero
	^(anEntero * denominator) / numerator.	
	"(aDivisor isKindOf: self class) ifTrue: [^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)].
	(aDivisor isKindOf: Entero) ifTrue: [^numerator  / (aDivisor * denominator )].

	self invalidNumberType"
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 11:53:15'!
divToFraccion: aFraccion
	^(denominator * aFraccion numerator) / (numerator * aFraccion denominator).

	"(aDivisor isKindOf: self class) ifTrue: [^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)].
	(aDivisor isKindOf: Entero) ifTrue: [^numerator  / (aDivisor * denominator )].

	self invalidNumberType"
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 11:53:39'!
multiToEntero: anEntero
	^anEntero * numerator / denominator 
	"
	(aMultiplier isKindOf: self class) ifTrue: [^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)].
	(aMultiplier isKindOf: Entero) ifTrue: [^aMultiplier * numerator / denominator ].

	self invalidNumberType 
	"! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 01:47:12'!
multiToFraccion: aFraccion
	^(numerator * aFraccion numerator) / (denominator * aFraccion denominator ).
	"
	(aMultiplier isKindOf: self class) ifTrue: [^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)].
	(aMultiplier isKindOf: Entero) ifTrue: [^aMultiplier * numerator / denominator ].

	self invalidNumberType 
	"! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'TM 4/20/2023 11:54:13'!
subToEntero: anEntero
	^(anEntero * denominator - numerator) / denominator
	"
	| newNumerator newDenominator |
	
	(aSubtrahend isKindOf: self class) ifTrue: [
		newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
		newDenominator := denominator * aSubtrahend denominator.
		^newNumerator / newDenominator 
	].
	(aSubtrahend isKindOf: Entero ) ifTrue: [^(numerator - (aSubtrahend * denominator )) / denominator].

	self invalidNumberType "
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Ms 4/19/2023 02:05:23'!
subToFraccion: aFraccion
	| newNumerator newDenominator |
	newNumerator := (denominator * aFraccion numerator) - (numerator * aFraccion denominator).
	newDenominator := denominator * aFraccion denominator.
	^newNumerator / newDenominator 
	
			"
	| newNumerator newDenominator |
	
	(aSubtrahend isKindOf: self class) ifTrue: [
		newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
		newDenominator := denominator * aSubtrahend denominator.
		^newNumerator / newDenominator 
	].
	(aSubtrahend isKindOf: Entero ) ifTrue: [^(numerator - (aSubtrahend * denominator )) / denominator].

	self invalidNumberType "
! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
