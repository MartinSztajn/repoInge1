!classDefinition: #AccountSummaryTest category: 'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:42:19'!
test01AccountSummaryWithBalanceZero

	| account1  message |
	
	account1 := ReceptiveAccount new.
			
	message := OrderedCollection new.	
	message add: 'Balance = 0'.

	self assert: message equals: (AccountSummary of: account1) value.
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:42:30'!
test02AccountSummaryWithDeposit

	| account1 message |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	
	message := OrderedCollection new.
	message add: 'Deposito por 100'.
	message add: 'Balance = 100'.

	
	self assert: message equals: (AccountSummary of: account1) value.
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:42:45'!
test03AccountSummaryWithWithdraw

	| account1 message |
	
	account1 := ReceptiveAccount new.
	Withdraw register: 100 on: account1.
	
	
	message := OrderedCollection new.
	message add: 'Extraccion por 100'.
	message add: 'Balance = -100'.

	
	self assert: message equals:  (AccountSummary of: account1) value.
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:42:49'!
test04AccountSummaryWithRecevingTransference

	| account1 account2 message |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Transference register: 100 from: account2  to: account1.
	
	
	message := OrderedCollection new.
	message add: 'Entrada por transferencia de 100'.
	message add: 'Balance = 100'.

	
	self assert: message equals: (AccountSummary of: account1) value.! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:42:52'!
test05AccountSummaryWithSendingTransference

	| account1 account2 message |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Transference register: 100 from: account2  to: account1.
	
	
	message := OrderedCollection new.
	message add: 'Salida por transferencia de 100'.
	message add: 'Balance = -100'.

	
	self assert: message equals: (AccountSummary of: account2) value.
! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:43:01'!
test06AccountSummaryWithManyTransactions
	| account1 account2 message |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account1.
	Transference register: 20 from: account1  to: account2.
	Transference register: 30 from: account2  to: account1.
	
	message := OrderedCollection new.
	message add: 'Deposito por 100'.
	message add: 'Extraccion por 50'.
	message add: 'Salida por transferencia de 20'.
	message add: 'Entrada por transferencia de 30'.
	message add: 'Balance = 60'.

	
	self assert: message equals:  (AccountSummary of: account1) value.! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:43:09'!
test07ManyAccountSummaryWithManyTransactions
	| account1 account2 message message2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account1.
	Transference register: 20 from: account1  to: account2.
	Transference register: 30 from: account2  to: account1.
	
	message := OrderedCollection new.
	message add: 'Deposito por 100'.
	message add: 'Extraccion por 50'.
	message add: 'Salida por transferencia de 20'.
	message add: 'Entrada por transferencia de 30'.
	message add: 'Balance = 60'.
	
	message2 := OrderedCollection new.
	message2 add: 'Entrada por transferencia de 20'.
	message2 add: 'Salida por transferencia de 30'.
	message2 add: 'Balance = -10'.

	
	self assert: message equals:  (AccountSummary of: account1) value.
	self assert: message2 equals:  (AccountSummary of: account2) value.

! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 14:43:28'!
test08PortofolioAccountSummaryWithBalanceZero
	| portfolio message |
	
	portfolio := Portfolio new.

	message := OrderedCollection new.
	message add: 'Balance = 0'.
	
	self assert: message equals:  (AccountSummary of: portfolio) value.

! !

!AccountSummaryTest methodsFor: 'test' stamp: 'Ms 5/31/2023 14:49:47'!
test09PortofolioAccountSummaryWithManyAccounts
	| portfolio account1 account2 message |

	account1  := ReceptiveAccount new.
	account2  := ReceptiveAccount new.

	Deposit register: 100  on: account1.
	Deposit register: 300  on: account2.
	
	portfolio := Portfolio with: account1 with: account2.


	message := OrderedCollection new.
	message add: 'Deposito por 100'.
	message add: 'Deposito por 300'.
	message add: 'Balance = 400'.
	
	self assert: message equals:  (AccountSummary of: portfolio) value.

! !


!classDefinition: #PortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #ReportPortfolioTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReportPortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReportPortfolioTest methodsFor: 'test' stamp: 'Ms 5/31/2023 15:05:25'!
test01PortofolioNotHaveAccounts

	| portfolio message |
	portfolio := Portfolio named: 'Portfolio de la familia'.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	
	self assert: message equals: (PortfolioEstruct of: portfolio) value
	! !

!ReportPortfolioTest methodsFor: 'test' stamp: 'Ms 5/31/2023 21:37:12'!
test02PortofolioWithOneAccount

	| portfolio myAccount message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.

	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	
	self assert: message equals: (PortfolioEstruct of: portfolio) value
	! !

!ReportPortfolioTest methodsFor: 'test' stamp: 'Ms 5/31/2023 21:37:23'!
test03PortofolioWithManyAccount

	| portfolio myAccount myAccount2 myAccount3 message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	myAccount2 := ReceptiveAccount named: 'Cuenta de Juan'.
	myAccount3 := ReceptiveAccount named: 'Cuenta de Miguel'.

	portfolio := Portfolio named: 'Portfolio de la familia'.
	portfolio add: myAccount.
	portfolio add: myAccount2.
	portfolio add: myAccount3.

	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '   Cuenta de Juan'.
	message add: '   Cuenta de Miguel'.


	
	self assert: message equals: (PortfolioEstruct of: portfolio) value
	! !

!ReportPortfolioTest methodsFor: 'test' stamp: 'Ms 5/31/2023 21:37:32'!
test04PortofolioContainsPortfolio

	| portfolio portfolio2 myAccount myAccount2 myAccount3  message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	myAccount2 := ReceptiveAccount named: 'Cuenta de Juan'.
	myAccount3 := ReceptiveAccount named: 'Cuenta de Angeles'.

	portfolio2 := Portfolio named: 'Portfolio de hijos'.
	portfolio2 add: myAccount2.
	portfolio2 add: myAccount3.

	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	portfolio add: portfolio2.

	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '   Portfolio de hijos'.
	message add: '      Cuenta de Juan'.
	message add: '      Cuenta de Angeles'.
	
	self assert: message equals: (PortfolioEstruct of: portfolio) value
	! !


!classDefinition: #ReportPortfolioTransactionsTest category: 'Portfolio-Solucion'!
TestCase subclass: #ReportPortfolioTransactionsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 5/31/2023 23:17:35'!
test01PortofolioNotHaveAccounts

	| portfolio message |
	portfolio := Portfolio named: 'Portfolio de la familia'.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Balance = 0'.
	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 5/31/2023 23:17:23'!
test02PortofolioWithOneAccount

	| portfolio myAccount message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.

	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '      Balance = 0'.
	message add: '   Balance = 0'.

	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 6/1/2023 00:02:03'!
test03PortofolioWithOneAccountWithDepostitTransaction

	| portfolio myAccount message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Deposit register: 100 on: myAccount.
	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '      Deposito por 100'.
	message add: '      Balance = 100'.
	message add: '   Balance = 100'.
	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 6/1/2023 00:01:41'!
test04PortofolioWithOneAccountWithWithdrawTransactions

	| portfolio myAccount message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Deposit register: 100 on: myAccount.
	Withdraw register: 20 on: myAccount.
	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '      Deposito por 100'.
	message add: '      Extraccion por 20'.
	message add: '      Balance = 80'.
	message add: '   Balance = 80'.
	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 6/1/2023 00:09:26'!
test05PortofolioWithOneAccountWithLegDepositTransaction

	| portfolio myAccount myAccount2 message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	myAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: myAccount.
	Withdraw register: 20 on: myAccount.
	Transference register: 10  from: myAccount2  to: myAccount.
	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '      Deposito por 100'.
	message add: '      Extraccion por 20'.
	message add: '      Entrada por transferencia de 10'.
	message add: '      Balance = 90'.
	message add: '   Balance = 90'.
	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 6/1/2023 00:13:48'!
test06PortofolioWithOneAccountWithLegWithdrawTransaction

	| portfolio myAccount myAccount2 message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	myAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: myAccount.
	Withdraw register: 20 on: myAccount.
	Transference register: 10  from: myAccount2  to: myAccount.
	Transference register: 5  from: myAccount to: myAccount2.
	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '      Deposito por 100'.
	message add: '      Extraccion por 20'.
	message add: '      Entrada por transferencia de 10'.
	message add: '      Salida por transferencia de 5'.
	message add: '      Balance = 85'.
	message add: '   Balance = 85'.
	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !

!ReportPortfolioTransactionsTest methodsFor: 'test' stamp: 'Ms 6/1/2023 00:24:05'!
test07PortofolioContainsOtherPortfolioWithManyTransactions

	| portfolio  portfolio2 myAccount myAccount2 myAccount3 myAccount4 message |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Deposit register: 100 on: myAccount.
	Withdraw register: 20 on: myAccount.
	
	myAccount2 := ReceptiveAccount named: 'Cuenta de Juan'.
	Deposit register: 40 on: myAccount2.
	Withdraw register: 10 on: myAccount2.
	
	myAccount4 := ReceptiveAccount new.
	myAccount3 := ReceptiveAccount named: 'Cuenta de Angeles'.
	Transference register: 5  from: myAccount3  to: myAccount4.
	
	portfolio2 := Portfolio named: 'Portfolio de hijos'.
	portfolio2 add: myAccount2.
	portfolio2 add: myAccount3.

	portfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	portfolio add: portfolio2.
	
	
	message := OrderedCollection new.
	message add: 'Portfolio de la familia'.
	message add: '   Cuenta mia'.
	message add: '      Deposito por 100'.
	message add: '      Extraccion por 20'.
	message add: '      Balance = 80'.
	message add: '   Portfolio de hijos'.
	message add: '      Cuenta de Juan'.
	message add: '         Deposito por 40'.
	message add: '         Extraccion por 10'.
	message add: '         Balance = 30'.
	message add: '      Cuenta de Angeles'.
	message add: '         Salida por transferencia de 5'.
	message add: '         Balance = -5'.
	message add: '      Balance = 25'.
	message add: '   Balance = 105'.
	
	self assert: message equals: (PortfolioEstructWithTransactions of: portfolio) value
	! !


!classDefinition: #TransferNetTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:43:45'!
test01TransferNetWithBalanceZero

	| account1  |
	
	account1 := ReceptiveAccount new.
			
	self assert: 0 equals: (TransferNet of: account1) value.
! !

!TransferNetTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:45:02'!
test02TransferNetWithRecevingTransference

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Transference register: 100 from: account2  to: account1.
	
	self assert: 100 equals: (TransferNet of: account1) value.! !

!TransferNetTest methodsFor: 'test' stamp: 'Ms 5/31/2023 12:46:38'!
test03TransferNetWithSendingTransference

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Transference register: 100 from: account2  to: account1.
	
	self assert: -100 equals: (TransferNet of: account2) value.
! !

!TransferNetTest methodsFor: 'test' stamp: 'Ms 5/31/2023 14:37:49'!
test04MultipleTransferencesTransferNet

	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.

	Transference register: 100 from: account2  to: account1.
	Transference register: 30 from: account1  to: account2.
	Transference register: 100 from: account2  to: account1.
	
	self assert: 170 equals: (TransferNet of: account1) value.
	self assert: -170 equals: (TransferNet of: account2) value.

! !

!TransferNetTest methodsFor: 'test' stamp: 'Ms 5/31/2023 14:51:10'!
test04PortfolioTransferNetWithBalanceZero

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals:  (TransferNet of: portfolio) value.


! !

!TransferNetTest methodsFor: 'test' stamp: 'Ms 5/31/2023 14:56:14'!
test05PortfolioTransferNetWithMultipleAccount

	| portfolio account1 account2 account3 |

	account1  := ReceptiveAccount new.
	account2  := ReceptiveAccount new.
	account3  := ReceptiveAccount new.

	Transference register: 100 from: account3  to: account1.
	Transference register: 300 from: account3  to: account2.

	portfolio := Portfolio with: account1 with: account2.
	
	self assert: 400 equals:  (TransferNet of: portfolio) value.
! !


!classDefinition: #TransferenceTest category: 'Portfolio-Solucion'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferenceTest methodsFor: 'test' stamp: 'Ms 5/29/2023 21:35:09'!
test01TransferAccountToAnotherAffectBalance
	| firstAccount secondAccount |
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: firstAccount.
	Transference register: 50 from: firstAccount to: secondAccount.
	
	self assert: 50 equals: firstAccount balance.
	self assert: 50 equals: secondAccount balance.! !

!TransferenceTest methodsFor: 'test' stamp: 'Ms 5/31/2023 01:49:46'!
test02AccountsHaveRegisterTransfer
	| firstAccount secondAccount aTransfer  |
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	aTransfer := Transference register: 50 from: firstAccount to: secondAccount.

	self assert: (firstAccount hasRegistered: aTransfer withdrawTransfer).
	self assert: (secondAccount hasRegistered: aTransfer depositTransfer).! !

!TransferenceTest methodsFor: 'test' stamp: 'Ms 5/31/2023 11:51:26'!
test03FirstAccountCanSearchSecondAccount
	| firstAccount secondAccount transfer |
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	transfer := Transference register: 50 from: firstAccount to: secondAccount.
	
	self assert: transfer withdrawTransfer equals: transfer depositTransfer getTransfer.
! !

!TransferenceTest methodsFor: 'test' stamp: 'Ms 5/31/2023 11:51:54'!
test04SecondAccountCanSearchFirstAccount
	| firstAccount secondAccount transfer |
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	transfer := Transference register: 50 from: firstAccount to: secondAccount.
	
	self assert: transfer depositTransfer equals: transfer withdrawTransfer getTransfer.
! !


!classDefinition: #Account category: 'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'process' stamp: 'Ms 6/1/2023 00:27:10'!
processReport: aReport

	self transactions do: [ :trans |  trans addTransactionToReport: aReport	].
	aReport printBalance: self balance
	

! !


!Account methodsFor: 'initialization' stamp: 'Ms 5/31/2023 15:31:14'!
initializeWithName: aName
	name := aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'Portfolio-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'Ms 5/31/2023 15:30:15'!
named: aName

	^self new initializeWithName: aName.! !


!classDefinition: #Portfolio category: 'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'Ms 5/31/2023 15:50:41'!
name
	^name ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'report' stamp: 'Ms 6/1/2023 02:17:10'!
acountReport: aReport withSize: aSize
	aReport printName: name withSize: aSize.
	accounts do: [ :acc |  	acc acountReport: aReport	 withSize: (aSize + 1)].
! !

!Portfolio methodsFor: 'report' stamp: 'Ms 6/1/2023 02:17:20'!
acountReportTransactions: aReport withSize: aSize
	aReport printName: name withSize: aSize.	
	accounts do: [ :acc |  	acc acountReportTransactions: aReport	 withSize: (aSize + 1) ].
	aReport printBalance: self balance withSize: (aSize + 1)

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Ms 5/31/2023 15:26:43'!
named: aName with: anAccount

	^(self new initializeWithName: aName) add: anAccount.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'Ms 5/31/2023 21:48:02'!
acountReport: aReport	 withSize: aSize	
	^aReport printName: name withSize: aSize.

! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'Ms 5/31/2023 23:55:38'!
acountReportTransactions: aReport	 withSize: aSize	
	aReport printName: name withSize: aSize.
	self processReport: aReport with: (aSize + 1)

	
	

! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'Ms 5/31/2023 15:53:15'!
name
	^name ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'Ms 6/1/2023 00:54:07'!
processReport: aReport with: aSize

	self transactions do: [ :trans |  trans addTransactionToReport: aReport	 withSize: aSize].
	aReport printBalance: self balance withSize: aSize
	

! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'Ms 5/31/2023 01:23:44'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !




!classDefinition: #AccountTransaction category: 'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'Ms 5/31/2023 01:27:01'!
affectBalance: aBalance 

	^aBalance + value ! !


!Deposit methodsFor: 'transactions' stamp: 'Ms 5/31/2023 12:31:40'!
addTransactionToReport: aReport
	^ aReport addDepositWithValue: self value.! !

!Deposit methodsFor: 'transactions' stamp: 'Ms 5/31/2023 23:48:53'!
addTransactionToReport: aReport	 withSize: aSize
	^ aReport addDepositWithValue: self value withSize: aSize! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #LegDepositTransfer category: 'Portfolio-Solucion'!
AccountTransaction subclass: #LegDepositTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!LegDepositTransfer methodsFor: 'transactions' stamp: 'Ms 5/31/2023 12:32:12'!
addTransactionToReport: aReport
   ^ aReport addLegDepositWithValue: self value.! !

!LegDepositTransfer methodsFor: 'transactions' stamp: 'Ms 6/1/2023 00:08:08'!
addTransactionToReport: aReport	 withSize: aSize
   ^ aReport addLegDepositWithValue: self value withSize: aSize
! !


!LegDepositTransfer methodsFor: 'initialize' stamp: 'Ms 5/31/2023 01:02:44'!
initializeFrom: aTransfer onAccount: anAccount
	transfer := aTransfer.
	anAccount register: self.! !


!LegDepositTransfer methodsFor: 'operation' stamp: 'Ms 5/31/2023 01:06:19'!
affectBalance: aBalance
	^aBalance + self value
	! !

!LegDepositTransfer methodsFor: 'operation' stamp: 'Ms 5/31/2023 11:51:15'!
getTransfer
	^transfer withdrawTransfer ! !

!LegDepositTransfer methodsFor: 'operation' stamp: 'Ms 5/31/2023 01:06:14'!
value 
	^transfer value
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LegDepositTransfer class' category: 'Portfolio-Solucion'!
LegDepositTransfer class
	instanceVariableNames: ''!

!LegDepositTransfer class methodsFor: 'as yet unclassified' stamp: 'Ms 5/31/2023 01:02:15'!
initializeWithTransfer: aTransfer onAccount: anAccount.
	^self new initializeFrom: aTransfer onAccount: anAccount.
! !


!classDefinition: #LegWithdrawTransfer category: 'Portfolio-Solucion'!
AccountTransaction subclass: #LegWithdrawTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!LegWithdrawTransfer methodsFor: 'operation' stamp: 'Ms 5/31/2023 01:06:24'!
affectBalance: aBalance
	^aBalance - self value
	! !

!LegWithdrawTransfer methodsFor: 'operation' stamp: 'Ms 5/31/2023 11:52:00'!
getTransfer
	^transfer depositTransfer! !

!LegWithdrawTransfer methodsFor: 'operation' stamp: 'Ms 5/31/2023 01:05:26'!
value
	^transfer value
	! !


!LegWithdrawTransfer methodsFor: 'initialize' stamp: 'Ms 5/31/2023 01:03:33'!
initializeFrom: aTransfer onAccount: anAccount
	transfer := aTransfer.
	anAccount register: self.! !


!LegWithdrawTransfer methodsFor: 'transactions' stamp: 'Ms 5/31/2023 12:33:00'!
addTransactionToReport: aReport
   ^ aReport addLegWithdrawWithValue: self value.! !

!LegWithdrawTransfer methodsFor: 'transactions' stamp: 'Ms 6/1/2023 00:12:59'!
addTransactionToReport: aReport withSize: aSize
   ^ aReport addLegWithdrawWithValue: self value withSize: aSize

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LegWithdrawTransfer class' category: 'Portfolio-Solucion'!
LegWithdrawTransfer class
	instanceVariableNames: ''!

!LegWithdrawTransfer class methodsFor: 'as yet unclassified' stamp: 'Ms 5/31/2023 01:03:20'!
initializeWithTransfer: aTransfer onAccount: anAccount.
	^self new initializeFrom: aTransfer onAccount: anAccount.
! !


!classDefinition: #Withdraw category: 'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'Ms 5/31/2023 01:26:50'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'transactions' stamp: 'Ms 5/31/2023 12:32:29'!
addTransactionToReport: aReport
   ^ aReport addWithdrawWithValue: self value.! !

!Withdraw methodsFor: 'transactions' stamp: 'Ms 5/31/2023 23:49:16'!
addTransactionToReport: aReport	 withSize: aSize
   ^ aReport addWithdrawWithValue: self value withSize: aSize
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Reporte category: 'Portfolio-Solucion'!
Object subclass: #Reporte
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Reporte methodsFor: 'initialize' stamp: 'Ms 5/31/2023 15:44:49'!
intializeWithAccount: anAccount
	self subclassResponsibility 
! !


!Reporte methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:35:16'!
addDepositWithValue: aValue
	self subclassResponsibility ! !

!Reporte methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:35:11'!
addLegDepositWithValue: aValue
	self subclassResponsibility ! !

!Reporte methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:35:30'!
addLegWithdrawWithValue: aValue
	self subclassResponsibility ! !

!Reporte methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:35:21'!
addWithdrawWithValue: aValue
	self subclassResponsibility ! !

!Reporte methodsFor: 'adding' stamp: 'Ms 6/1/2023 01:50:48'!
identarSize: aSize

	| identar |
	identar := ''.
	aSize timesRepeat: [ identar := identar ,'   '. ].
	^identar 
	! !


!Reporte methodsFor: 'message' stamp: 'Ms 6/1/2023 02:01:05'!
balanceWithValue: aValue
	^'Balance = ', aValue asString.! !

!Reporte methodsFor: 'message' stamp: 'Ms 6/1/2023 02:05:49'!
depositWithValue: aValue
	^'Deposito por ', aValue asString.! !

!Reporte methodsFor: 'message' stamp: 'Ms 6/1/2023 02:07:52'!
legDepositWithValue: aValue
	^'Entrada por transferencia de ', aValue asString.! !

!Reporte methodsFor: 'message' stamp: 'Ms 6/1/2023 02:07:33'!
legWithdrawWithValue: aValue
	^'Salida por transferencia de ', aValue asString.! !

!Reporte methodsFor: 'message' stamp: 'Ms 6/1/2023 02:06:38'!
withdrawWithValue: aValue
	^'Extraccion por ', aValue asString.! !


!Reporte methodsFor: 'value' stamp: 'Ms 6/1/2023 02:12:31'!
value
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Reporte class' category: 'Portfolio-Solucion'!
Reporte class
	instanceVariableNames: ''!

!Reporte class methodsFor: 'as yet unclassified' stamp: 'Ms 5/31/2023 12:26:11'!
of: anAccount
	^self new intializeWithAccount: anAccount.! !


!classDefinition: #AccountSummary category: 'Portfolio-Solucion'!
Reporte subclass: #AccountSummary
	instanceVariableNames: 'message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'initialize' stamp: 'Ms 6/1/2023 00:29:05'!
intializeWithAccount: anAccount
	account := anAccount.
	message := OrderedCollection new.
	account processReport: self.! !


!AccountSummary methodsFor: 'message' stamp: 'Ms 6/1/2023 02:04:54'!
printBalance: aValue
	message add: (self balanceWithValue: aValue)
! !

!AccountSummary methodsFor: 'message' stamp: 'Ms 5/31/2023 12:41:29'!
value
	^message! !


!AccountSummary methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:10:50'!
addDepositWithValue: aValue
	^message add:  (self depositWithValue: aValue)! !

!AccountSummary methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:11:00'!
addLegDepositWithValue: aValue
	^message add:  (self legDepositWithValue: aValue)! !

!AccountSummary methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:11:11'!
addLegWithdrawWithValue: aValue
	^message add:  (self legWithdrawWithValue: aValue)! !

!AccountSummary methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:11:22'!
addWithdrawWithValue: aValue
	^message add:  (self withdrawWithValue: aValue)! !


!classDefinition: #PortfolioEstruct category: 'Portfolio-Solucion'!
Reporte subclass: #PortfolioEstruct
	instanceVariableNames: 'message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioEstruct methodsFor: 'initialize' stamp: 'Ms 5/31/2023 21:28:07'!
intializeWithAccount: anAccount
	account := anAccount.
	message := OrderedCollection new.
	account acountReport: self withSize: 0.
! !


!PortfolioEstruct methodsFor: 'message' stamp: 'Ms 6/1/2023 02:03:23'!
printBalance: aBalance
	^self balanceWithValue: aBalance

! !

!PortfolioEstruct methodsFor: 'message' stamp: 'Ms 6/1/2023 02:08:17'!
printName: aName withSize: aSize
	message add: (self identarSize: aSize), aName
! !

!PortfolioEstruct methodsFor: 'message' stamp: 'Ms 5/31/2023 15:57:18'!
value
	^message ! !


!classDefinition: #PortfolioEstructWithTransactions category: 'Portfolio-Solucion'!
Reporte subclass: #PortfolioEstructWithTransactions
	instanceVariableNames: 'message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioEstructWithTransactions methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:08:58'!
addDepositWithValue: aValue withSize: aSize

	message add: (self identarSize: aSize), (self depositWithValue: aValue)! !

!PortfolioEstructWithTransactions methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:09:36'!
addLegDepositWithValue: aValue withSize: aSize

	message add: (self identarSize: aSize) ,  (self legDepositWithValue: aValue)! !

!PortfolioEstructWithTransactions methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:09:47'!
addLegWithdrawWithValue: aValue withSize: aSize
	
	message add: (self identarSize: aSize) ,  (self legWithdrawWithValue: aValue)! !

!PortfolioEstructWithTransactions methodsFor: 'adding' stamp: 'Ms 6/1/2023 02:09:57'!
addWithdrawWithValue: aValue withSize: aSize
	
	message add: (self identarSize: aSize) ,  (self withdrawWithValue: aValue)! !


!PortfolioEstructWithTransactions methodsFor: 'initialize' stamp: 'Ms 5/31/2023 22:08:03'!
intializeWithAccount: anAccount
	account := anAccount.
	message := OrderedCollection new.
	account acountReportTransactions: self withSize: 0.
! !


!PortfolioEstructWithTransactions methodsFor: 'message' stamp: 'Ms 6/1/2023 02:01:46'!
printBalance: aBalance withSize: aSize

	message add: (self identarSize: aSize), (self balanceWithValue: aBalance).
! !

!PortfolioEstructWithTransactions methodsFor: 'message' stamp: 'Ms 6/1/2023 01:56:44'!
printName: aName withSize: aSize
	
	message add: (self identarSize: aSize), aName
! !

!PortfolioEstructWithTransactions methodsFor: 'message' stamp: 'Ms 5/31/2023 22:02:20'!
value
	^message! !


!classDefinition: #TransferNet category: 'Portfolio-Solucion'!
Reporte subclass: #TransferNet
	instanceVariableNames: 'balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'message' stamp: 'Ms 6/1/2023 02:02:37'!
printBalance: aValue
	^self balanceWithValue: aValue
! !

!TransferNet methodsFor: 'message' stamp: 'Ms 5/31/2023 12:41:38'!
value
	^balance! !


!TransferNet methodsFor: 'initialize' stamp: 'Ms 6/1/2023 00:28:54'!
intializeWithAccount: anAccount
	account := anAccount.
	balance := 0.
	account processReport: self.
! !


!TransferNet methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:35:58'!
addDepositWithValue: aValue
	 ! !

!TransferNet methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:36:36'!
addLegDepositWithValue: aValue
	balance := balance + aValue	 ! !

!TransferNet methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:36:47'!
addLegWithdrawWithValue: aValue
	balance := balance - aValue	 ! !

!TransferNet methodsFor: 'adding' stamp: 'Ms 5/31/2023 12:35:54'!
addWithdrawWithValue: aValue
	 ! !


!classDefinition: #Transference category: 'Portfolio-Solucion'!
Object subclass: #Transference
	instanceVariableNames: 'value withdraw deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transference methodsFor: 'value' stamp: 'Ms 5/31/2023 01:44:41'!
depositTransfer  
	^deposit ! !

!Transference methodsFor: 'value' stamp: 'Ms 5/30/2023 23:25:38'!
value
	^value ! !

!Transference methodsFor: 'value' stamp: 'Ms 5/31/2023 01:44:35'!
withdrawTransfer  
	^withdraw! !


!Transference methodsFor: 'initialize' stamp: 'Ms 5/31/2023 02:18:32'!
intializeValue: aValue from: firstAccount to: secondAccount
	value := aValue.
	withdraw := LegWithdrawTransfer initializeWithTransfer: self onAccount: firstAccount.
	deposit := LegDepositTransfer initializeWithTransfer: self onAccount: secondAccount.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'Portfolio-Solucion'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'category-name' stamp: 'Ms 5/30/2023 16:36:35'!
accountNotIncludedInTransfer
	^'Account Not Incuded In This Transfer'! !

!Transference class methodsFor: 'category-name' stamp: 'Ms 5/29/2023 21:41:39'!
register: aValue from: firstAccount to: secondAccount 
	^self new intializeValue: aValue from: firstAccount to: secondAccount.! !
