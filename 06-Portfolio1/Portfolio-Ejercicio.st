!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:43:31'!
test01PortfolioHasZeroBalanceWhenCreated
	
	self assert: 0 equals:  self createPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:41:08'!
test02PortfolioBalanceEqualsOneAccountBalance

	| portfolio account |
	
	portfolio := self createPortfolio.
	account := self createAccount.
	
	Deposit register: 100 on: account.
	
	portfolio add: account.
	
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:44:23'!
test03PortfolioBalanceEqualsManyAccountsBalance

	| portfolio firstAccount secondAccount |
	
	portfolio := self createPortfolio.
	
	firstAccount := self createAccount.
	Deposit register: 100 on: firstAccount.
	
	secondAccount := self createAccount.
	Deposit register: 200 on: secondAccount.
	
	portfolio add: firstAccount.
	portfolio add: secondAccount.
	
	self assert: (firstAccount balance + secondAccount balance) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:43:09'!
test04PortfolioHasNotRegisteredTransaction

	| portfolio account transaction |
	
	portfolio := self createPortfolio.
	
	account := self createAccount.
	transaction := Deposit register: 100 on: account.
		
	self deny: (portfolio hasRegistered: transaction)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:42:17'!
test05PortfolioHasRegisteredTransactionInOneAccount

	| portfolio account transaction |
	
	portfolio := self createPortfolio.
	account := self createAccount.
	
	transaction := Deposit register: 100 on: account.
	
	portfolio add: account.
		
	self assert: (portfolio hasRegistered: transaction)! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:44:16'!
test06PortfolioHasRegisteredTransactionsInManyAccounts

	| firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount firstTransaction secondTransaction |
	
	firstPortfolio := self createPortfolio.
	firstAccount := self createAccount.
	firstTransaction := Deposit register: 100 on: firstAccount.
	firstPortfolio add: firstAccount.
	
	secondPortfolio := self createPortfolio.
	secondAccount := self createAccount.
	secondTransaction := Deposit register: 300 on: secondAccount.
	secondPortfolio add: secondAccount.
	
	thirdPortfolio := self createPortfolio.
	thirdPortfolio add: firstPortfolio.
	thirdPortfolio add: secondPortfolio.
	
	self assert: (thirdPortfolio hasRegistered: firstTransaction).
	self assert: (thirdPortfolio hasRegistered: secondTransaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:38:36'!
test07PortfolioTransactionsEqualAssetsTransactions

	| firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount firstTransaction secondTransaction thirdTransaction fourthTransaction transactions |

	firstPortfolio := self createPortfolio.
	firstAccount := self createAccount.
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 200 on: firstAccount.
	thirdTransaction := Deposit register: 300 on: firstAccount.
	
	secondPortfolio := self createPortfolio.
	secondAccount := self createAccount.
	fourthTransaction := Deposit register: 300 on: secondAccount.
	
	firstPortfolio add: firstAccount.
	secondPortfolio add: secondAccount.
	
	thirdPortfolio := self createPortfolio.
	
	thirdPortfolio add: firstPortfolio.
	thirdPortfolio add: secondPortfolio.
	
	transactions := Set new.
	transactions add: firstTransaction.
	transactions add: secondTransaction.
	transactions add: thirdTransaction.
	transactions add: fourthTransaction.
	
	self assert:  transactions equals: thirdPortfolio transactions.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:29:04'!
test08PortfolioCannotAddItself

	| portfolio |

	portfolio := self createPortfolio.	
	
	self
		should: [	portfolio add: portfolio.]
		raise: Error 
		withMessageText: Portfolio cannotAddExistingAssetErrorDescription 

! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:29:04'!
test09PortfolioCannotAddExistingAccount

	| portfolio account |

	portfolio := self createPortfolio.	
	account := self createAccount.
	
	portfolio add: account.

	self
		should: [	portfolio add: account.]
		raise: Error 
		withMessageText: Portfolio cannotAddExistingAssetErrorDescription 

! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:29:04'!
test10PortfolioCannotAddExistingAccountInChild

	| parentPortfolio childPortfolio account |

	parentPortfolio := self createPortfolio.
	childPortfolio  := self createPortfolio.	
	account := self createAccount.
	
	parentPortfolio add: childPortfolio.
	childPortfolio add: account.

	self
		should: [	parentPortfolio add: account.]
		raise: Error 
		withMessageText: Portfolio cannotAddExistingAssetErrorDescription 

! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:29:04'!
test11PortfolioCannotAddExistingAccountInParent

	| parentPortfolio childPortfolio account |

	parentPortfolio := self createPortfolio.
	childPortfolio  := self createPortfolio.	
	account := self createAccount.
	
	parentPortfolio add: account.
	parentPortfolio add: childPortfolio.

	self
		should: [	childPortfolio add: account.]
		raise: Error 
		withMessageText: Portfolio cannotAddExistingAssetErrorDescription 

! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:46:19'!
test12PortfolioCannotAddExistingAccountInMultipleParents

	| parentPortfolio1 parentPortfolio2 childPortfolio account |

	parentPortfolio1 := self createPortfolio.
	parentPortfolio2 := self createPortfolio.
	childPortfolio  := self createPortfolio.	
	
	account := self createAccount.
	parentPortfolio1 add: account.
	
	parentPortfolio1 add: childPortfolio.
	parentPortfolio2 add: childPortfolio.

	self
		should: [	childPortfolio add: account.]
		raise: Error 
		withMessageText: Portfolio cannotAddExistingAssetErrorDescription 

! !

!PortfolioTest methodsFor: 'tests' stamp: 'TM 5/22/2023 14:45:11'!
test13PortfolioCannotAddExistingAccountInAncestor

	| grandparentPortfolio parentPortfolio childPortfolio account |

	grandparentPortfolio := self createPortfolio.
	parentPortfolio  := self createPortfolio.	
	childPortfolio  := self createPortfolio.	

	account := self createAccount.	
	grandparentPortfolio add: account.
	
	grandparentPortfolio add: parentPortfolio.
	parentPortfolio add: childPortfolio.

	self
		should: [	childPortfolio add: account.]
		raise: Error 
		withMessageText: Portfolio cannotAddExistingAssetErrorDescription 

! !


!PortfolioTest methodsFor: 'misc' stamp: 'Ms 5/16/2023 18:35:25'!
createAccount

	^ ReceptiveAccount new! !

!PortfolioTest methodsFor: 'misc' stamp: 'Ms 5/16/2023 18:34:56'!
createPortfolio

	^ Portfolio new! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:24:04'!
test01ReceptiveAccountHasZeroAsBalanceWhenCreated 

	| account |

	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:24:17'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |

	account := ReceptiveAccount  new.

	Deposit register: 100 on: account.

	self assert: 100 equals: account balance.

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:25:19'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |

	account := ReceptiveAccount new.

	Deposit register: 100 on: account.

	Withdraw register: 50 on: account.

	self assert: 50 equals: account balance.

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:25:34'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |

	account := ReceptiveAccount new.

	withdrawValue := 50.

	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:25:58'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.

	deposit := Deposit register: 100 on: account.

	withdraw := Withdraw register: 50 on: account.

	self assert: (account hasRegistered: deposit).

	self assert: (account hasRegistered: withdraw).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Ms 5/18/2023 20:17:07'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |

	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.

		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'TM 5/22/2023 13:44:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |

	account1 := ReceptiveAccount new.

	deposit1 := Deposit register: 50 on: account1.


	self assert: 1 equals: account1 transactions size.

	self assert: (account1 transactions includes: deposit1).

! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'TM 5/22/2023 13:20:11'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'TM 5/22/2023 13:21:35'!
register: aValue on: account

	| transaction |

	transaction := self for: aValue.

	account register: transaction.

	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'Ms 5/15/2023 19:45:18'!
initializeFor: aValue

	value := aValue.
! !


!Deposit methodsFor: 'value' stamp: 'Ms 5/15/2023 20:16:34'!
affectBalance: balance

	^ balance + self value! !

!Deposit methodsFor: 'value' stamp: 'TM 5/22/2023 13:20:43'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'TM 5/22/2023 13:21:15'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'Ms 5/15/2023 19:54:20'!
initializeFor: aValue

	value := aValue.
! !


!Withdraw methodsFor: 'value' stamp: 'TM 5/22/2023 13:21:00'!
affectBalance: balance

	^ balance - self value! !

!Withdraw methodsFor: 'value' stamp: 'TM 5/22/2023 13:20:56'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'TM 5/22/2023 13:21:11'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'assets balance parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'transactions' stamp: 'TM 5/22/2023 14:18:36'!
transactions

	| transactions |
	
	transactions := Set new.
	
	assets do:		[ :asset |
		transactions addAll: asset transactions.  	
	 ].
	
	^transactions! !


!Portfolio methodsFor: 'balance' stamp: 'TM 5/22/2023 14:39:08'!
balance

	^assets sum: [ :each | each balance ] ifEmpty: [0]! !


!Portfolio methodsFor: 'initialization' stamp: 'TM 5/22/2023 14:38:35'!
initialize

	balance := 0.
	assets := Set new.
	parent := self.! !


!Portfolio methodsFor: 'testing' stamp: 'TM 5/22/2023 14:37:45'!
anyParentContains: anAsset

	parent = self
	ifFalse: [ ^parent anyParentContains: anAsset ]
	ifTrue: [ ^	self contains: anAsset ].
! !

!Portfolio methodsFor: 'testing' stamp: 'TM 5/22/2023 14:31:36'!
contains: anAsset

	^assets anySatisfy: [ :each | each contains: anAsset ].
! !

!Portfolio methodsFor: 'testing' stamp: 'TM 5/22/2023 14:35:02'!
hasRegistered: aTransaction

	^assets anySatisfy: [ :each | each hasRegistered: aTransaction ].! !


!Portfolio methodsFor: 'adding' stamp: 'TM 5/22/2023 14:35:39'!
add: asset

	(asset isEqualTo: self) ifTrue: [^self error: Portfolio cannotAddExistingAssetErrorDescription ].
	
	(self contains: asset ) ifTrue: [^self error: Portfolio cannotAddExistingAssetErrorDescription ].

	asset parentPortfolio: self.
	(self anyParentContains: asset ) ifTrue: [^self error: Portfolio cannotAddExistingAssetErrorDescription ].

	^assets add: asset.
		! !

!Portfolio methodsFor: 'adding' stamp: 'TM 5/22/2023 14:36:02'!
parentPortfolio: aPortfolio

	parent := aPortfolio.
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'TM 5/22/2023 14:29:04'!
cannotAddExistingAssetErrorDescription

	^'Asset already exists in hierarchy!!'.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'TM 5/22/2023 13:22:44'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'TM 5/22/2023 13:22:36'!
register: aTransaction

	transactions add: aTransaction 

! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'TM 5/22/2023 13:22:39'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'TM 5/22/2023 13:22:30'!
balance

	| acum |
	
	acum := 0.
	
	transactions do: [ :each |
		acum := each affectBalance: acum.
	].

	^acum.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'TM 5/22/2023 14:31:36'!
contains: acount

	^(self = acount)

! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'TM 5/22/2023 13:23:09'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 

! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'TM 5/22/2023 14:25:52'!
parentPortfolio: aPortfolio! !
