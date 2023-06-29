!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'setUp - tearDown' stamp: 'ms] 6/26/2023 00:59:15'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.! !

!ImportTest methodsFor: 'setUp - tearDown' stamp: 'ms] 6/25/2023 23:00:40'!
tearDown
	
	session commit.
	session close.! !


!ImportTest methodsFor: 'testing' stamp: 'ms] 6/26/2023 00:54:51'!
test01Import
	
	self importCusomers.  
	self assertCustomers.
	self assertAllExistingCustomers.
	



	

	 
	
	
	! !


!ImportTest methodsFor: 'customers' stamp: 'ms] 6/26/2023 00:41:46'!
juanPerez
	
	
	| customer |

	customer := Customer new.
	customer firstName: 'Juan'.
	customer lastName: 'Perez'.
	customer identificationType: 'C'.
	customer identificationNumber: '23-25666777-9'.
	customer addAddress: self streetAlem1122.
	^customer.
! !

!ImportTest methodsFor: 'customers' stamp: 'ms] 6/26/2023 00:43:59'!
pepeSanchez
	
	
	| customer |

	customer := Customer new.
	customer firstName: 'Pepe'.
	customer lastName: 'Sanchez'.
	customer identificationType: 'D'.
	customer identificationNumber: '22333444'.
	customer addAddress: self streetMaipu888 .
	customer addAddress: self streetSanMartin3322 .

	^customer.
! !


!ImportTest methodsFor: 'accesing' stamp: 'ms] 6/26/2023 00:28:01'!
compareCustomer: aCustomer1 with: aCustomer2 
	^ (aCustomer1 firstName = aCustomer2 firstName) &
	  (aCustomer1 lastName = aCustomer2 lastName) &
	  (aCustomer1 identificationType = aCustomer2 identificationType) &
	  (aCustomer1 identificationNumber = aCustomer2 identificationNumber)
! !

!ImportTest methodsFor: 'accesing' stamp: 'ms] 6/25/2023 23:16:08'!
getCustomersFromStream

	^ReadStream on:'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'.! !

!ImportTest methodsFor: 'accesing' stamp: 'ms] 6/25/2023 23:18:31'!
importCusomers

	^ (CustomerImporter importToSession: session theCustomers: self getCustomersFromStream) import! !

!ImportTest methodsFor: 'accesing' stamp: 'ms] 6/26/2023 00:30:51'!
selectCustomerWithIdentificationNumber: aNumber

	^(session select: [ :aCustomer | 	aCustomer identificationNumber = aNumber] ofType: Customer) atRandom.
	



	

	 
	
	
	! !


!ImportTest methodsFor: 'street' stamp: 'ms] 6/26/2023 00:42:49'!
streetAlem1122
	
	
	| address |

	address := Address new.
	address streetName: 'Alem'.
	address streetNumber: 1122.
	address town: 'CABA'.
	address zipCode: 1001.
	address province: 'CABA'.
	^address.
! !

!ImportTest methodsFor: 'street' stamp: 'ms] 6/26/2023 00:43:05'!
streetMaipu888
	
	| address |
	
	address := Address new.
	address streetName: 'Maipu'.
	address streetNumber: 888.
	address town: 'Florida'.
	address zipCode: 1122.
	address province: 'Buenos Aires'.
	^address! !

!ImportTest methodsFor: 'street' stamp: 'ms] 6/26/2023 00:43:18'!
streetSanMartin3322
	
	| address|
	
	address := Address new.
	address streetName: 'San Martin'.
	address streetNumber: 3322.
	address town: 'Olivos'.
	address zipCode: 1636.
	address province: 'BsAs'.
	
	^address.! !


!ImportTest methodsFor: 'assertions' stamp: 'ms] 6/26/2023 01:12:11'!
assertAdress: add isEquals: aAddress 
	^ add streetName = aAddress streetName &
	  add streetNumber = aAddress streetNumber &
	  add zipCode = aAddress zipCode &
	  add town = aAddress town &
	  add province = aAddress province! !

!ImportTest methodsFor: 'assertions' stamp: 'ms] 6/26/2023 01:07:49'!
assertAllExistingCustomers

	| pepe juan |
	
	pepe := self selectCustomerWithIdentificationNumber: '22333444'. 
	self assert: (self compareCustomer: pepe with: self pepeSanchez).
	self assert: (self assertStreetName: self streetSanMartin3322 isContainsIn: pepe addresses).
	self assert: (self assertStreetName: self streetMaipu888 isContainsIn: pepe addresses).

	
	juan := self selectCustomerWithIdentificationNumber: '23-25666777-9'. 
	self assert: (self compareCustomer: juan with: self juanPerez)	.
	self assert: (self assertStreetName: self streetAlem1122 isContainsIn: juan addresses).
! !

!ImportTest methodsFor: 'assertions' stamp: 'ms] 6/25/2023 23:45:10'!
assertCustomers

	^ self assert: 2 equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'ms] 6/26/2023 01:13:09'!
assertStreetName: aAddress isContainsIn: aAddressExpected 
	^aAddressExpected anySatisfy: [ :add | self assertAdress: add isEquals: aAddress ].! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'Ms 6/25/2023 17:48:20'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'Ms 6/25/2023 17:48:20'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'Ms 6/25/2023 17:48:20'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'Ms 6/25/2023 17:48:20'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'Ms 6/25/2023 17:48:20'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'Ms 6/25/2023 17:48:20'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'twon' stamp: 'Ms 6/25/2023 17:48:20'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'Ms 6/25/2023 17:48:20'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'Ms 6/25/2023 17:48:20'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'Ms 6/25/2023 17:48:20'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'Ms 6/25/2023 17:48:20'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'Ms 6/25/2023 17:48:20'!
addresses

	^ addresses! !

!Customer methodsFor: 'addresses' stamp: 'ms] 6/26/2023 00:00:37'!
getAdressOnStreet: aStreetName 
	^addresses detect: [ :anAdress | 	anAdress streetName = aStreetName]! !


!Customer methodsFor: 'name' stamp: 'Ms 6/25/2023 17:48:20'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'Ms 6/25/2023 17:48:20'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'Ms 6/25/2023 17:48:20'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'Ms 6/25/2023 17:48:20'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'Ms 6/25/2023 17:48:20'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'Ms 6/25/2023 17:48:20'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'Ms 6/25/2023 17:48:20'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'Ms 6/25/2023 17:48:20'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'Ms 6/25/2023 17:48:20'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Customer class' category: 'CustomerImporter'!
Customer class
	instanceVariableNames: ''!

!Customer class methodsFor: 'importing' stamp: 'Ms 6/25/2023 17:48:20'!
importCustomers

	"
	self importCustomers
	"
	| inputStream session newCustomer line |

	inputStream := UniFileStream new open: 'input.txt' forWrite: false.
	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.

	line := inputStream nextLine.
	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			customerData := line findTokens: $,.
			newCustomer := Customer new.
			newCustomer firstName: customerData second.
			newCustomer lastName: customerData third.
			newCustomer identificationType: customerData fourth.
			newCustomer identificationNumber: customerData fourth.
			session persist: newCustomer ].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: addressData second.
			newAddress streetNumber: addressData third asNumber .
			newAddress town: addressData fourth.
			newAddress zipCode: addressData fifth asNumber .
			newAddress province: addressData fourth ].

		line := inputStream nextLine. ].

	session commit.
	session close.

	inputStream close.
	! !


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session input'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'intialization' stamp: 'ms] 6/25/2023 23:08:48'!
initializeWithSession: aSession theCustomers: aCustomers
	session := aSession.
	input := aCustomers.! !


!CustomerImporter methodsFor: 'as yet unclassified' stamp: 'ms] 6/25/2023 23:09:42'!
import
	| newCustomer line |

	line := input nextLine.
	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			customerData := line findTokens: $,.
			newCustomer := Customer new.
			newCustomer firstName: customerData second.
			newCustomer lastName: customerData third.
			newCustomer identificationType: customerData fourth.
			newCustomer identificationNumber: customerData fifth.
			session persist: newCustomer ].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: addressData second.
			newAddress streetNumber: addressData third asNumber .
			newAddress town: addressData fourth.
			newAddress zipCode: addressData fifth asNumber .
			newAddress province: addressData sixth ].

		line := input nextLine. ].

	input close.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'initialization' stamp: 'ms] 6/25/2023 23:08:06'!
importToSession: aSession theCustomers: aCustomers 
	^self new initializeWithSession: aSession theCustomers: aCustomers.! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'Ms 6/25/2023 17:48:20'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'Ms 6/25/2023 17:48:20'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'Ms 6/25/2023 17:48:20'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'Ms 6/25/2023 17:48:20'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'Ms 6/25/2023 17:48:20'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'Ms 6/25/2023 17:48:20'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'Ms 6/25/2023 17:48:20'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'Ms 6/25/2023 17:48:20'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'Ms 6/25/2023 17:48:20'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'Ms 6/25/2023 17:48:20'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'Ms 6/25/2023 17:48:20'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'Ms 6/25/2023 17:48:20'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'Ms 6/25/2023 17:48:20'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
