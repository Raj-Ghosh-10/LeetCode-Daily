class Bank {

    long[] balanceArray;
    int maxAcc;

    public Bank(long[] balance) {
        balanceArray = balance;
        maxAcc =  balance.length;
    }

    public boolean isValidAcc(int acc){
        return acc >=1 && acc <= maxAcc;
    }
    
    public boolean transfer(int account1, int account2, long money) {
        if(isValidAcc(account1) && isValidAcc(account2) && balanceArray[account1-1] >= money){
            balanceArray[account1-1] = balanceArray[account1-1] - money;
            balanceArray[account2-1] = balanceArray[account2-1] + money;
            return true;
        }
        return false;
    }
    
    public boolean deposit(int account, long money) {
        if(isValidAcc(account)){
            balanceArray[account-1] = balanceArray[account-1] + money;
            return true;
        }
        return false;
    }
    
    public boolean withdraw(int account, long money) {
        if(isValidAcc(account) && balanceArray[account-1] >= money){
            balanceArray[account-1] = balanceArray[account-1] - money;
            return true;
        }
        return false;
    }
}

/**
 * Your Bank object will be instantiated and called as such:
 * Bank obj = new Bank(balance);
 * boolean param_1 = obj.transfer(account1,account2,money);
 * boolean param_2 = obj.deposit(account,money);
 * boolean param_3 = obj.withdraw(account,money);
 */