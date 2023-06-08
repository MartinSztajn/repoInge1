!classDefinition: #CarritoTest category: 'TusLibros.com'!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CarritoTest methodsFor: 'test' stamp: 'ms 6/8/2023 10:59:30'!
test01CartEmptyWhenCreated
	
	| carrito |
	carrito := Carrito new.
	
	self assert: carrito elementos isEmpty.! !

!CarritoTest methodsFor: 'test' stamp: 'ms 6/8/2023 11:39:32'!
test02CartContainsOneItem
	
	| carrito item itemsList |
	carrito := Carrito new.
	
	itemsList := ListBook new.
	item := ItemBook withIsbn: 'hola' quantity:  2.
	
	itemsList createItem: item.
	
	carrito addToCart: item inList: itemsList.
	
	
	
	self assert: carrito elementos first equals: item.! !

!CarritoTest methodsFor: 'test' stamp: 'ms 6/8/2023 11:39:27'!
test03ListAllImtemsOfCart
	
	| carrito itemsList item item2 item3 |
	carrito := Carrito new.
	itemsList := ListBook new.
	item := ItemBook withIsbn: 'hola' quantity:  2.
	item2 := ItemBook withIsbn: 'chau' quantity:  3.
	item3 := ItemBook withIsbn: 'buenas' quantity:  1.
	
	itemsList createItem: item.
	itemsList createItem: item2.
	itemsList createItem: item3.

	carrito addToCart: item inList: itemsList.
	carrito addToCart: item2 inList: itemsList.
	carrito addToCart: item3 inList: itemsList.
	
	self assert: carrito elementos equals: itemsList items.! !

!CarritoTest methodsFor: 'test' stamp: 'ms 6/8/2023 11:39:05'!
test04CanNotAddItemNotCreated
	
	| carrito itemsList item item2 item3 |
	carrito := Carrito new.
	itemsList := ListBook new.
	item := ItemBook withIsbn: 'hola' quantity:  2.
	item2 := ItemBook withIsbn: 'chau' quantity:  3.
	
	itemsList createItem: item.
	itemsList createItem: item2.

	item3 := ItemBook withIsbn: 'buenas' quantity:  1.
	
	
	self 

		should: [	carrito addToCart: item3 inList: itemsList]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Carrito invalidItemErrorDescription.
		 ]

	! !


!classDefinition: #Carrito category: 'TusLibros.com'!
Object subclass: #Carrito
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Carrito methodsFor: 'elements' stamp: 'ms 6/8/2023 11:36:40'!
addToCart: aItemBook
	items add: aItemBook.! !

!Carrito methodsFor: 'elements' stamp: 'ms 6/8/2023 11:36:46'!
addToCart: aItemBook inList: aList
	(self assertItemBookIsCreated: aItemBook inList: aList) 
		ifTrue: [ items add: aItemBook. ]
		ifFalse: [	 ^self error: self class invalidItemErrorDescription].
	! !

!Carrito methodsFor: 'elements' stamp: 'ms 6/8/2023 11:08:47'!
elementos
	^items! !


!Carrito methodsFor: 'initialize' stamp: 'ms 6/8/2023 11:09:16'!
initialize
	items := OrderedCollection new.! !


!Carrito methodsFor: 'private' stamp: 'ms 6/8/2023 11:38:19'!
assertItemBookIsCreated: aItemBook inList: aList
	^(aList items includes: aItemBook)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: 'TusLibros.com'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'error' stamp: 'ms 6/8/2023 11:36:25'!
invalidItemErrorDescription
	^'El Item no esta creado'! !


!classDefinition: #ItemBook category: 'TusLibros.com'!
Object subclass: #ItemBook
	instanceVariableNames: 'isbn quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!ItemBook methodsFor: 'initialize' stamp: 'ms 6/8/2023 11:07:26'!
initializeWithIsbn: aIsbn quantity:  aQuantity
	isbn := aIsbn.
	quantity := aQuantity.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemBook class' category: 'TusLibros.com'!
ItemBook class
	instanceVariableNames: ''!

!ItemBook class methodsFor: 'as yet unclassified' stamp: 'ms 6/8/2023 11:06:11'!
withIsbn: aIsbn quantity:  aQuantity.
	^self new initializeWithIsbn: aIsbn quantity:  aQuantity.
! !


!classDefinition: #ListBook category: 'TusLibros.com'!
Object subclass: #ListBook
	instanceVariableNames: 'itemsCreated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!ListBook methodsFor: 'initialize' stamp: 'ms 6/8/2023 11:19:42'!
initialize
	itemsCreated := OrderedCollection new.! !


!ListBook methodsFor: 'accessing' stamp: 'ms 6/8/2023 11:28:42'!
items
	^itemsCreated ! !


!ListBook methodsFor: 'adding' stamp: 'ms 6/8/2023 11:19:00'!
createItem: aItemBook.
	itemsCreated add: aItemBook.
! !
