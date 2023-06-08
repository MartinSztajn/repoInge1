!classDefinition: #CarritoTest category: 'TusLibros'!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:24:41'!
test01CarritoIsEmptyWhenCreated
	
	| carrito |
	
	carrito := Carrito new.
	
	self assert: carrito isEmpty! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:43:05'!
test02CannotAddBookNotInListing
	
	| carrito listing isbn |
	
	listing := BookListing new.	
	carrito := Carrito for: listing.
	
	isbn := 9783161484100.
	"listing addISBN: isbn."
	
	self 
		should: [ carrito addISBN: isbn. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: Carrito invalidItemErrorDescription equals: anError messageText.
		]! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:25:32'!
test03CanAddBookInListing
	
	| carrito listing isbn |
	
	listing := BookListing new.	
	carrito := Carrito for: listing.
	
	isbn := 9783161484100.
	listing addISBN: isbn.
	
	carrito addISBN: isbn.! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:42:21'!
test04CarritoContainsAddedBook
	
	| carrito listing isbn |
	
	listing := BookListing new.
	carrito := Carrito for: listing.
	
	isbn := 9783161484100.
	listing addISBN: isbn.
	
	carrito addISBN: isbn.	
	
	self assert: (carrito hasISBN: isbn).! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:39:41'!
test05CanAddBookWithQuantity
	
	| carrito listing isbn quantity |
	
	listing := BookListing new.
	carrito := Carrito for: listing.
	
	isbn := 9783161484100.
	listing addISBN: isbn.
	
	quantity := 10.
	carrito addISBN: isbn quantity: quantity.	
	
	self assert: quantity equals: (carrito quantityOf: isbn).! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:44:47'!
test06CannotAddNonPositiveQuantities
	
	| carrito listing isbn quantity |
	
	listing := BookListing new.
	carrito := Carrito for: listing.
	
	isbn := 9783161484100.
	listing addISBN: isbn.
	
	quantity := 0.
	
	self 
		should: [ carrito addISBN: isbn quantity: quantity.	 ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: Carrito invalidQuantityErrorDescription equals: anError messageText.
		]! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 15:47:47'!
test07CanAddBookMultipleTimes
	
	| carrito listing isbn |
	
	listing := BookListing new.
	carrito := Carrito for: listing.
	
	isbn := 9783161484100.
	listing addISBN: isbn.
	
	carrito addISBN: isbn.	
	carrito addISBN: isbn.	
	
	self assert: 2 equals: (carrito quantityOf: isbn).! !

!CarritoTest methodsFor: 'tests' stamp: 'TM 6/8/2023 16:00:40'!
test08ListItemsInCart
	
	| carrito listing isbn1 isbn2 items |
	
	listing := BookListing new.
	carrito := Carrito for: listing.
	
	isbn1 := 9783161484100.
	isbn2 := 9780262046305.
	listing addISBN: isbn1.
	listing addISBN: isbn2.
	
	carrito addISBN: isbn1.
	carrito addISBN: isbn2.
	
	items := Dictionary new.
	items at: isbn1 put: 1.
	items at: isbn2 put: 1.
	
	self assert: items = (carrito items).! !


!classDefinition: #BookListing category: 'TusLibros'!
Object subclass: #BookListing
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!BookListing methodsFor: 'testing' stamp: 'TM 6/8/2023 15:19:08'!
hasISBN: anISBN
	^items includes: anISBN.! !


!BookListing methodsFor: 'adding' stamp: 'TM 6/8/2023 15:19:35'!
addISBN: anISBN
	items add: anISBN.! !


!BookListing methodsFor: 'initialization' stamp: 'TM 6/8/2023 15:09:44'!
initialize
	items := Set new! !


!classDefinition: #Carrito category: 'TusLibros'!
Object subclass: #Carrito
	instanceVariableNames: 'items listing'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'adding' stamp: 'TM 6/8/2023 15:40:05'!
addISBN: anISBN

	self addISBN: anISBN quantity: 1! !

!Carrito methodsFor: 'adding' stamp: 'TM 6/8/2023 15:53:22'!
addISBN: anISBN quantity: aPositiveQuantity

	| finalQuantity |

	(listing hasISBN: anISBN)
	ifFalse: [ ^self error: Carrito invalidItemErrorDescription ].
	
	(aPositiveQuantity < 1)
	ifTrue: [ ^self error: Carrito invalidQuantityErrorDescription ].
	
	finalQuantity := aPositiveQuantity.
	
	items at: anISBN
	ifPresent: [ :currentQuantity | finalQuantity := finalQuantity + currentQuantity. ].
	
	items at: anISBN put: finalQuantity.! !


!Carrito methodsFor: 'initialization' stamp: 'TM 6/8/2023 15:20:50'!
initialize
	items := Dictionary new.! !

!Carrito methodsFor: 'initialization' stamp: 'TM 6/8/2023 15:21:06'!
initializeFor: aListing
	listing := aListing.! !


!Carrito methodsFor: 'testing' stamp: 'TM 6/8/2023 15:33:57'!
hasISBN: anISBN
	^items includesKey: anISBN.! !

!Carrito methodsFor: 'testing' stamp: 'TM 6/8/2023 15:21:43'!
isEmpty
	^items isEmpty.! !


!Carrito methodsFor: 'accessing' stamp: 'TM 6/8/2023 15:58:21'!
items
	^items! !

!Carrito methodsFor: 'accessing' stamp: 'TM 6/8/2023 15:39:11'!
quantityOf: anISBN 
	^items at: anISBN.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: 'TusLibros'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'error' stamp: 'TM 6/8/2023 15:44:24'!
invalidItemErrorDescription
	^'El item no está listado'! !

!Carrito class methodsFor: 'error' stamp: 'TM 6/8/2023 15:44:27'!
invalidQuantityErrorDescription
	^'La cantidad especificada es inválida'! !


!Carrito class methodsFor: 'instance creation' stamp: 'TM 6/8/2023 13:48:43'!
for: aMarket 
	^self new initializeFor: aMarket ! !
