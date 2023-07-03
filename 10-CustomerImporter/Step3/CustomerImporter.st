!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'customerSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:48:25'!
test01ValidDataIsImportedCorrectly

	CustomerImporter valueFrom: self validImportData into: customerSystem .

	self assertImportedRightNumberOfCustomers.
	self assertPepeSanchezWasImportedCorrecty.
	self assertJuanPerezWasImportedCorrectly ! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:50:42'!
test02CanNotImportAddressWithoutCustomer

	self
		should: [ CustomerImporter valueFrom: self addressWithoutCustomerData into: customerSystem. ]
		raise: Error - MessageNotUnderstood
		withMessageText: CustomerImporter canNotImportAddressWithoutCustomerErrorDescription

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test03DoesNotImportRecordsStartingWithCButMoreCharacters

	self
		shouldFailImporting: self invalidCustomerRecordStartData
		messageText: CustomerImporter invalidRecordTypeErrorDescription
		asserting: [ self assertNoCustomerWasImported ]

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test04DoesNotImportRecordsStartingWithAButMoreCharacters

	self
		shouldFailImporting: self invalidAddressRecordStartData
		messageText: CustomerImporter invalidRecordTypeErrorDescription
		asserting: [ self assertImportedOneCustomerWithoutAddress ]

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test05CanNotImportAddressRecordWithLessThanSixFields

	self
		shouldFailImporting: self addressRecordWithLessThanSixFields
		messageText: CustomerImporter invalidAddressRecordErrorDescription
		asserting: [ self assertImportedOneCustomerWithoutAddress ]

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test06CanNotImportAddressRecordWithMoreThanSixFields

	self
		shouldFailImporting: self addressRecordWithMoreThanSixFields
		messageText: CustomerImporter invalidAddressRecordErrorDescription
		asserting: [ self assertImportedOneCustomerWithoutAddress ]

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test07CanNotImportCustomerRecordWithLessThanFiveFields

	self
		shouldFailImporting: self customerRecordWithLessThanFiveFields
		messageText: CustomerImporter invalidCustomerRecordErrorDescription
		asserting: [ self assertNoCustomerWasImported ]

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test08CanNotImportCustomerRecordWithMoreThanFiveFields

	self
		shouldFailImporting: self customerRecordWithMoreThanFiveFields
		messageText: CustomerImporter invalidCustomerRecordErrorDescription
		asserting: [ self assertNoCustomerWasImported ]

	! !

!ImportTest methodsFor: 'tests' stamp: 'ms 7/3/2023 00:15:22'!
test09CannotImportEmptyLine

	self
		shouldFailImporting: self emptyLine
		messageText: CustomerImporter invalidRecordTypeErrorDescription
		asserting: [ self assertNoCustomerWasImported ]

	! !


!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertAddressOf: importedCustomer at: aStreetName hasNumber: aNumber town: aTown zipCode: aZipCode province: aProvince

	| importedAddress |

	importedAddress := importedCustomer addressAt: aStreetName ifNone: [ self fail ].
	self assert: aStreetName equals: importedAddress streetName.
	self assert: aNumber equals: importedAddress streetNumber.
	self assert: aTown equals: importedAddress town.
	self assert: aZipCode equals: importedAddress zipCode.
	self assert: aProvince equals: importedAddress province.

	! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertCustomerWithIdentificationType: anIdType number: anIdNumber hasFirstName: aFirstName lastName: aLastName

	| importedCustomer |

	importedCustomer := self customerWithIdentificationType: anIdType number: anIdNumber.

	self assert: aFirstName equals: importedCustomer firstName.
	self assert: aLastName equals: importedCustomer lastName.
	self assert: anIdType equals: importedCustomer identificationType.
	self assert: anIdNumber equals: importedCustomer identificationNumber.

	^importedCustomer

	! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertImportedOneCustomerWithoutAddress

	| importedCustomer |

	self assert: 1 equals: self numberOfCustomers.
	importedCustomer := self customerWithIdentificationType: 'D' number: '22333444'.
	self assert: importedCustomer isAddressesEmpty
	! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertImportedRightNumberOfCustomers

	^ self assert: 2 equals: self numberOfCustomers! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertJuanPerezWasImportedCorrectly

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'C' number: '23-25666777-9' hasFirstName: 'Juan' lastName: 'Perez'.
	self assertAddressOf: importedCustomer at: 'Alem' hasNumber: 1122 town: 'CABA' zipCode: 1001 province: 'CABA'
	! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertNoCustomerWasImported

	^ self assert: 0 equals: self numberOfCustomers! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:15:22'!
assertPepeSanchezWasImportedCorrecty

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'D' number: '22333444' hasFirstName: 'Pepe' lastName: 'Sanchez'.
	self assertAddressOf: importedCustomer at: 'San Martin' hasNumber: 3322 town: 'Olivos' zipCode: 1636 province: 'BsAs'.
	self assertAddressOf: importedCustomer at: 'Maipu' hasNumber: 888 town: 'Florida' zipCode: 1122 province: 'Buenos Aires'.


	! !

!ImportTest methodsFor: 'assertions' stamp: 'ms 7/3/2023 00:51:57'!
shouldFailImporting: aReadStream messageText: anErrorMessageText asserting: anAssertionBlock

	self
		should: [ CustomerImporter valueFrom: aReadStream into: customerSystem. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anErrorMessageText equals: anError messageText.
			anAssertionBlock value ]

	! !


!ImportTest methodsFor: 'setUp/tearDown' stamp: 'ms 7/3/2023 00:57:03'!
setUp
	
	customerSystem := Enviroment current createSystem.
	customerSystem beginTransaction.
! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'ms 7/3/2023 00:29:29'!
tearDown

	customerSystem commit.
	customerSystem stop.
	! !


!ImportTest methodsFor: 'customer' stamp: 'ms 7/3/2023 00:51:36'!
customerWithIdentificationType: anIdType number: anIdNumber

	^ customerSystem customerWithIdentificationType: anIdType number: anIdNumber
	! !

!ImportTest methodsFor: 'customer' stamp: 'ms 7/3/2023 00:22:29'!
numberOfCustomers

	^ customerSystem numberOfCustomers! !

!ImportTest methodsFor: 'customer' stamp: 'ms 7/3/2023 00:17:52'!
session

	^customerSystem session! !


!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
addressRecordWithLessThanSixFields

	^ReadStream on: 'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
addressRecordWithMoreThanSixFields

	^ReadStream on: 'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs,x'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
addressWithoutCustomerData

	^ReadStream on: 'A,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
customerRecordWithLessThanFiveFields

	^ReadStream on: 'C,Pepe,Sanchez,D'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
customerRecordWithMoreThanFiveFields

	^ReadStream on: 'C,Pepe,Sanchez,D,22333444,x'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
emptyLine

	^ReadStream on: '
'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
invalidAddressRecordStartData

	^ReadStream on: 'C,Pepe,Sanchez,D,22333444
AA,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
invalidCustomerRecordStartData

	^ReadStream on: 'CC,Pepe,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'ms 7/3/2023 00:15:22'!
validImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'ms 7/3/2023 00:15:21'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'ms 7/3/2023 00:15:21'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'ms 7/3/2023 00:15:21'!
isAt: aStreetName

	^streetName = aStreetName ! !

!Address methodsFor: 'street' stamp: 'ms 7/3/2023 00:15:21'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'ms 7/3/2023 00:15:21'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'ms 7/3/2023 00:15:21'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'ms 7/3/2023 00:15:21'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'twon' stamp: 'ms 7/3/2023 00:15:21'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'ms 7/3/2023 00:15:21'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'ms 7/3/2023 00:15:21'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'ms 7/3/2023 00:15:21'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'ms 7/3/2023 00:15:21'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'ms 7/3/2023 00:15:21'!
addressAt: aStreetName ifNone: aNoneBlock

	^addresses detect: [ :address | address isAt: aStreetName ] ifNone: aNoneBlock ! !

!Customer methodsFor: 'addresses' stamp: 'ms 7/3/2023 00:15:21'!
addresses

	^ addresses! !

!Customer methodsFor: 'addresses' stamp: 'ms 7/3/2023 00:15:21'!
isAddressesEmpty

	^addresses isEmpty ! !


!Customer methodsFor: 'name' stamp: 'ms 7/3/2023 00:15:21'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'ms 7/3/2023 00:15:21'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'ms 7/3/2023 00:15:21'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'ms 7/3/2023 00:15:21'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'ms 7/3/2023 00:15:21'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'ms 7/3/2023 00:15:21'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'ms 7/3/2023 00:15:21'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'ms 7/3/2023 00:15:21'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'ms 7/3/2023 00:15:21'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Customer class' category: 'CustomerImporter'!
Customer class
	instanceVariableNames: ''!

!Customer class methodsFor: 'importing' stamp: 'ms 7/3/2023 00:15:21'!
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
	instanceVariableNames: 'customerSystem readStream newCustomer line record'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'ms 7/3/2023 00:35:56'!
initializeFrom: aReadStream into: aCustomerSystem
	customerSystem  := aCustomerSystem.
	readStream := aReadStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'ms 7/3/2023 00:15:21'!
value

	[ self hasLineToImport ] whileTrue: [
		self createRecord.
		self importRecord ].

	! !


!CustomerImporter methodsFor: 'customer' stamp: 'ms 7/3/2023 00:15:21'!
assertValidCustomerRecord

	^ record size ~= 5 ifTrue: [ self error: self class invalidCustomerRecordErrorDescription ]! !

!CustomerImporter methodsFor: 'customer' stamp: 'ms 7/3/2023 00:35:34'!
importCustomer

	self assertValidCustomerRecord.

	newCustomer := Customer new.
	newCustomer firstName: record second.
	newCustomer lastName: record third.
	newCustomer identificationType: record fourth.
	newCustomer identificationNumber: record fifth.
	customerSystem  persist: newCustomer! !

!CustomerImporter methodsFor: 'customer' stamp: 'ms 7/3/2023 00:15:21'!
isCustomerRecord

	^ record first = 'C'! !


!CustomerImporter methodsFor: 'address' stamp: 'ms 7/3/2023 00:15:21'!
assertCustomerWasImported

	^ newCustomer ifNil: [ self error: self class canNotImportAddressWithoutCustomerErrorDescription ]! !

!CustomerImporter methodsFor: 'address' stamp: 'ms 7/3/2023 00:15:21'!
assertValidAddressRecord

	^ record size ~= 6 ifTrue: [ self error: self class invalidAddressRecordErrorDescription ]! !

!CustomerImporter methodsFor: 'address' stamp: 'ms 7/3/2023 00:15:21'!
importAddress

	| newAddress |

	self assertCustomerWasImported.
	self assertValidAddressRecord.

	newAddress := Address new.
	newCustomer addAddress: newAddress.
	newAddress streetName: record second.
	newAddress streetNumber: record third asNumber .
	newAddress town: record fourth.
	newAddress zipCode: record fifth asNumber .
	newAddress province: record sixth! !

!CustomerImporter methodsFor: 'address' stamp: 'ms 7/3/2023 00:15:21'!
isAddressRecord

	^ record first = 'A'! !


!CustomerImporter methodsFor: 'evaluating - private' stamp: 'ms 7/3/2023 00:15:21'!
assertRecordNotEmpty

	record isEmpty ifTrue: [ self error: self class invalidRecordTypeErrorDescription ]! !

!CustomerImporter methodsFor: 'evaluating - private' stamp: 'ms 7/3/2023 00:15:21'!
createRecord

	^ record := line findTokens: $,! !

!CustomerImporter methodsFor: 'evaluating - private' stamp: 'ms 7/3/2023 00:15:21'!
hasLineToImport

	line := readStream nextLine.
	^line notNil! !

!CustomerImporter methodsFor: 'evaluating - private' stamp: 'ms 7/3/2023 00:15:21'!
importRecord

	self assertRecordNotEmpty.

	self isCustomerRecord ifTrue: [ ^self importCustomer ].
	self isAddressRecord ifTrue: [ ^self importAddress ].

	self error: self class invalidRecordTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'ms 7/3/2023 00:36:17'!
from: aReadStream into: aCustomerSystem
	^self new initializeFrom: aReadStream into: aCustomerSystem! !


!CustomerImporter class methodsFor: 'importing' stamp: 'ms 7/3/2023 00:36:25'!
valueFrom: aReadStream into: aCustomerSystem

	^(self from: aReadStream into: aCustomerSystem) value! !


!CustomerImporter class methodsFor: 'error messages' stamp: 'ms 7/3/2023 00:15:21'!
canNotImportAddressWithoutCustomerErrorDescription

	^'Cannot import address without customer'! !

!CustomerImporter class methodsFor: 'error messages' stamp: 'ms 7/3/2023 00:15:21'!
invalidAddressRecordErrorDescription

	^'Address record has to have six fields'! !

!CustomerImporter class methodsFor: 'error messages' stamp: 'ms 7/3/2023 00:15:21'!
invalidCustomerRecordErrorDescription

	^'Invalid Customer record'! !

!CustomerImporter class methodsFor: 'error messages' stamp: 'ms 7/3/2023 00:15:21'!
invalidRecordTypeErrorDescription

	^'Invalid record type'! !


!classDefinition: #CustomerSystem category: 'CustomerImporter'!
Object subclass: #CustomerSystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerSystem methodsFor: 'starting' stamp: 'ms 7/3/2023 00:44:52'!
start

	self subclassResponsibility! !


!CustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:45:22'!
beginTransaction

	self subclassResponsibility! !

!CustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:45:17'!
commit

	self subclassResponsibility! !

!CustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:45:03'!
stop

	self subclassResponsibility! !


!CustomerSystem methodsFor: 'accesing' stamp: 'ms 7/3/2023 00:45:32'!
customerWithIdentificationType: anIdType number: anIdNumber

	self subclassResponsibility! !

!CustomerSystem methodsFor: 'accesing' stamp: 'ms 7/3/2023 00:45:27'!
numberOfCustomers

	self subclassResponsibility! !


!CustomerSystem methodsFor: 'adding' stamp: 'ms 7/3/2023 00:45:11'!
persist: aCustomer

	self subclassResponsibility! !


!classDefinition: #PersistentCustomerSystem category: 'CustomerImporter'!
CustomerSystem subclass: #PersistentCustomerSystem
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!PersistentCustomerSystem methodsFor: 'adding' stamp: 'ms 7/3/2023 00:33:21'!
persist: aCustomer

	session persist: aCustomer! !


!PersistentCustomerSystem methodsFor: 'accesing' stamp: 'ms 7/3/2023 00:36:48'!
customerWithIdentificationType: anIdType number: anIdNumber
	
		^ (session
		select: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]
		ofType: Customer) anyOne! !

!PersistentCustomerSystem methodsFor: 'accesing' stamp: 'ms 7/3/2023 00:36:51'!
numberOfCustomers

	^ (session selectAllOfType: Customer) size! !


!PersistentCustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:36:40'!
beginTransaction

	session beginTransaction! !

!PersistentCustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:36:44'!
commit

	session commit! !

!PersistentCustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:36:57'!
stop

	session close! !


!PersistentCustomerSystem methodsFor: 'starting' stamp: 'ms 7/3/2023 00:16:12'!
start
	session := DataBaseSession for: (Array with: Address with: Customer)! !


!classDefinition: #TransistentCustomerSystem category: 'CustomerImporter'!
CustomerSystem subclass: #TransistentCustomerSystem
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!TransistentCustomerSystem methodsFor: 'starting' stamp: 'ms 7/3/2023 00:41:23'!
start

	customers := OrderedCollection new.! !


!TransistentCustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:43:44'!
beginTransaction
! !

!TransistentCustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:44:18'!
commit
	
! !

!TransistentCustomerSystem methodsFor: 'actions' stamp: 'ms 7/3/2023 00:44:20'!
stop
	
! !


!TransistentCustomerSystem methodsFor: 'adding' stamp: 'ms 7/3/2023 00:41:47'!
persist: aNewCustomer 
	
	customers add: aNewCustomer! !


!TransistentCustomerSystem methodsFor: 'accessing' stamp: 'ms 7/3/2023 00:42:09'!
customerWithIdentificationType: anIdType number: anIdNumber 
	
	^customers detect: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]! !

!TransistentCustomerSystem methodsFor: 'accessing' stamp: 'ms 7/3/2023 00:41:54'!
numberOfCustomers
	
	^customers size! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'ms 7/3/2023 00:15:22'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'ms 7/3/2023 00:15:22'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'ms 7/3/2023 00:15:22'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'ms 7/3/2023 00:15:22'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'ms 7/3/2023 00:15:22'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'ms 7/3/2023 00:15:22'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'ms 7/3/2023 00:15:22'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'ms 7/3/2023 00:15:22'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'ms 7/3/2023 00:15:22'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'ms 7/3/2023 00:15:22'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'ms 7/3/2023 00:15:22'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'ms 7/3/2023 00:15:22'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'ms 7/3/2023 00:15:22'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !


!classDefinition: #Enviroment category: 'CustomerImporter'!
Object subclass: #Enviroment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Enviroment methodsFor: 'creation' stamp: 'ms 7/3/2023 00:56:31'!
createSystem
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Enviroment class' category: 'CustomerImporter'!
Enviroment class
	instanceVariableNames: ''!

!Enviroment class methodsFor: 'current' stamp: 'ms 7/3/2023 00:56:11'!
current
	self subclassesDo: [:subclass | (subclass isCurrent) ifTrue: [^subclass new.].].! !

!Enviroment class methodsFor: 'current' stamp: 'ms 7/3/2023 00:56:19'!
isCurrent
	self subclassResponsibility.! !


!classDefinition: #DeveloperEnviroment category: 'CustomerImporter'!
Enviroment subclass: #DeveloperEnviroment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DeveloperEnviroment methodsFor: 'creation' stamp: 'ms 7/3/2023 00:54:21'!
createSystem
	
	^TransistentCustomerSystem new start! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DeveloperEnviroment class' category: 'CustomerImporter'!
DeveloperEnviroment class
	instanceVariableNames: ''!

!DeveloperEnviroment class methodsFor: 'asserting' stamp: 'ms 7/3/2023 00:54:59'!
isCurrent

	^true.! !


!classDefinition: #IntegratorEnviroment category: 'CustomerImporter'!
Enviroment subclass: #IntegratorEnviroment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!IntegratorEnviroment methodsFor: 'creation' stamp: 'ms 7/3/2023 00:55:20'!
createSystem
	
	^PersistentCustomerSystem new start.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IntegratorEnviroment class' category: 'CustomerImporter'!
IntegratorEnviroment class
	instanceVariableNames: ''!

!IntegratorEnviroment class methodsFor: 'asserting' stamp: 'ms 7/3/2023 00:58:23'!
isCurrent

	^true.! !
