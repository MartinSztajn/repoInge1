!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'priceList cart cashier salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'auxiliary' stamp: 'TM 6/12/2023 12:48:21'!
activeCreditCard

	^ self creditCardExpiring: (Date tomorrow).! !

!CashierTest methodsFor: 'auxiliary' stamp: 'TM 6/12/2023 13:19:37'!
creditCardExpiring: anExpirationDate

	^CreditCard withNumber: '5500 1000 0000 1234' withExpiration: anExpirationDate withOwner: 'Pepe'.! !

!CashierTest methodsFor: 'auxiliary' stamp: 'TM 6/12/2023 12:47:51'!
expiredCreditCard

	^ CreditCard withNumber: '5500 1000 0000 1234' withExpiration: (Date yesterday) withOwner: 'Pepe'! !

!CashierTest methodsFor: 'auxiliary' stamp: 'TM 6/12/2023 13:34:14'!
setup

	priceList := PriceList new.
	priceList add: 9780262046305 for: 39.99.
	priceList add: 1000000000000 for: 20.00.
	
	cart := Cart acceptingItemsOf: priceList.
	
	cashier := Cashier new.
	salesBook := OrderedCollection new.! !


!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test01CanNotCheckoutEmptyCart

	| creditCard merchantProcessor |
	
	self setup.
		
	creditCard := self activeCreditCard.
	merchantProcessor := SuccessfulMerchantProcessor new.
	
	self
		should: [ cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Cashier emptyCartErrorMessage equals: anError messageText.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test02CanCheckoutSingleItem

	| creditCard merchantProcessor |
	
	self setup.
	
	cart add: 9780262046305.
		
	creditCard := self activeCreditCard.
	merchantProcessor := SuccessfulMerchantProcessor new.
	
	cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook.
	
	self assert: 1 equals: salesBook size.
	self assert: 39.99 equals: salesBook first.! !

!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test03CanCheckoutMultipleItems

	| creditCard merchantProcessor |
	
	self setup.
	
	cart add: 9780262046305.
	cart add: 1000000000000.
		
	creditCard := self activeCreditCard.
	merchantProcessor := SuccessfulMerchantProcessor new.
	
	cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook.
	
	self assert: 1 equals: salesBook size.
	self assert: 59.99 equals: salesBook first.! !

!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test04CanNotUseExpiredCreditCard

	| creditCard merchantProcessor |
	
	self setup.
	
	cart add: 9780262046305.
		
	creditCard := self expiredCreditCard.
	merchantProcessor := SuccessfulMerchantProcessor new.
	
	self
		should: [ cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cashier expiredCreditCardErrorMessage equals: anError messageText.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test05CanNotUseFundlessCreditCard

	| creditCard merchantProcessor |
	
	self setup.
	
	cart add: 9780262046305.
		
	creditCard := self activeCreditCard.
	merchantProcessor := FundlessMerchantProcessor new.
	
	self
		should: [ cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: MerchantProcessor fundlessCreditCardErrorMessage equals: anError messageText.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test06CanNotUseOtherPersonCreditCard

	| creditCard merchantProcessor |
	
	self setup.
	
	cart add: 9780262046305.
	
	creditCard := self activeCreditCard.
	merchantProcessor := OtherPersonMerchantProcessor new.
	
	self
		should: [ cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: MerchantProcessor otherPersonCreditCardErrorMessage equals: anError messageText.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'TM 6/12/2023 13:34:14'!
test07CheckoutsIfEverythingOk

	| creditCard merchantProcessor |
	
	self setup.
	
	cart add: 9780262046305.
		
	creditCard := self activeCreditCard.
	merchantProcessor := SuccessfulMerchantProcessor new.
	
	cashier checkout: cart with: creditCard using: merchantProcessor into: salesBook.
	
	self assert: 1 equals: salesBook size.
	self assert: 39.99 equals: salesBook first.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'checkout' stamp: 'TM 6/12/2023 11:58:57'!
total
	^items sum: [ :item | catalog priceOf: item ] ifEmpty: [ ^0. ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout' stamp: 'TM 6/12/2023 13:16:15'!
checkout: aCart with: aCreditCard using: aMerchantProcessor into: aSalesBook 
	
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard.
	
	aMerchantProcessor debit: (aCart total) from: aCreditCard.
	
	aSalesBook add: (aCart total).! !


!Cashier methodsFor: 'assertions' stamp: 'TM 6/12/2023 13:10:35'!
assertCartIsNotEmpty: aCart
	
	(aCart isEmpty) 	ifTrue: [ self error: Cashier emptyCartErrorMessage ].! !

!Cashier methodsFor: 'assertions' stamp: 'TM 6/12/2023 13:11:12'!
assertCreditCardIsNotExpired: aCreditCard
	
	(aCreditCard expirationDate < Date today) 	ifTrue: [ self error: Cashier expiredCreditCardErrorMessage ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'TM 6/12/2023 10:08:47'!
emptyCartErrorMessage
	^'Cannot checkout empty cart'.! !

!Cashier class methodsFor: 'error messages' stamp: 'TM 6/12/2023 12:12:49'!
expiredCreditCardErrorMessage
	^'Credit card is expired'.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber expirationDate personName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'TM 6/12/2023 12:11:33'!
initializeWithNumber: aCreditCardNumber withExpiration: anExpirationDate withOwner: aPersonName 
	creditCardNumber := aCreditCardNumber.
	expirationDate := anExpirationDate.
	personName := aPersonName.! !


!CreditCard methodsFor: 'accessing' stamp: 'TM 6/12/2023 12:25:30'!
expirationDate
	^expirationDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'TM 6/12/2023 12:11:17'!
withNumber: aCreditCardNumber withExpiration: anExpirationDate withOwner: aPersonName
	^self new initializeWithNumber: aCreditCardNumber withExpiration: anExpirationDate withOwner: aPersonName.! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'transaction' stamp: 'TM 6/12/2023 13:04:16'!
debit: anAmount from: aCreditCard
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error messages' stamp: 'TM 6/12/2023 12:59:46'!
fundlessCreditCardErrorMessage
	^'Credit card is fundless'.! !

!MerchantProcessor class methodsFor: 'error messages' stamp: 'TM 6/12/2023 13:03:36'!
otherPersonCreditCardErrorMessage
	^'Credit Card belongs to other person'.! !


!classDefinition: #FundlessMerchantProcessor category: 'TusLibros'!
MerchantProcessor subclass: #FundlessMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FundlessMerchantProcessor methodsFor: 'transaction' stamp: 'TM 6/12/2023 13:04:26'!
debit: anAmount from: aCreditCard 
	^self error: MerchantProcessor fundlessCreditCardErrorMessage.! !


!classDefinition: #OtherPersonMerchantProcessor category: 'TusLibros'!
MerchantProcessor subclass: #OtherPersonMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!OtherPersonMerchantProcessor methodsFor: 'transaction' stamp: 'TM 6/12/2023 13:04:33'!
debit: anAmount from: aCreditCard 
	^self error: MerchantProcessor otherPersonCreditCardErrorMessage.! !


!classDefinition: #SuccessfulMerchantProcessor category: 'TusLibros'!
MerchantProcessor subclass: #SuccessfulMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SuccessfulMerchantProcessor methodsFor: 'transaction' stamp: 'TM 6/12/2023 13:07:18'!
debit: total from: aCreditCard! !


!classDefinition: #PriceList category: 'TusLibros'!
Object subclass: #PriceList
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PriceList methodsFor: 'testing' stamp: 'TM 6/12/2023 13:24:38'!
includes: anItem
	^items includesKey: anItem.! !


!PriceList methodsFor: 'accessing' stamp: 'TM 6/12/2023 13:24:38'!
priceOf: anItem
	^items at: anItem.! !


!PriceList methodsFor: 'adding' stamp: 'TM 6/12/2023 13:24:38'!
add: anItem for: aPrice
	items at: anItem put: aPrice.! !


!PriceList methodsFor: 'initialization' stamp: 'TM 6/12/2023 13:24:38'!
initialize
	items := Dictionary new.! !
