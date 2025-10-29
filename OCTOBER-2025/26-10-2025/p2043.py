class Bank:

    def __init__(self, balance: List[int]):
        self.balance = balance
        self.n = len(self.balance)

    def transfer(self, account1: int, account2: int, money: int) -> bool:
        if not self.is_in_range(account1) or not self.is_in_range(account2):
            return False
        
        account1Money = self.balance[account1 - 1]
        account2Money = self.balance[account2 - 1]

        if account1Money >= money:
            self.balance[account1 - 1] -= money
            self.balance[account2 - 1] += money
            return True
        return False

    def deposit(self, account: int, money: int) -> bool:
        if not self.is_in_range(account):
            return False
        
        self.balance[account - 1] += money
        return True

    def withdraw(self, account: int, money: int) -> bool:
        if not self.is_in_range(account):
            return False
        
        accountMoney = self.balance[account - 1]

        if money <= accountMoney:
            self.balance[account - 1] -= money
            return True
        return False
    
    def is_in_range(self, account):
        return account >= 1 and account <= self.n


# Your Bank object will be instantiated and called as such:
# obj = Bank(balance)
# param_1 = obj.transfer(account1,account2,money)
# param_2 = obj.deposit(account,money)
# param_3 = obj.withdraw(account,money)