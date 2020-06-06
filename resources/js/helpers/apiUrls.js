const makeUrl = route => {
    return `http://${location.hostname}:8000/api${route}`;
};
export default {
    login: () => {
        return makeUrl("/login");
    },
    logout() {
        return makeUrl("/logout");
    },
    accounts: () => {
        return makeUrl("/accounts");
    },
    accountTypes: () => {
        return makeUrl("/account_types");
    },
    banks: () => {
        return makeUrl("/banks");
    },
    currencies: () => {
        return makeUrl("/currencies");
    },
    addAccount: () => {
        return makeUrl("/account/add");
    },
    updateAccount: (id) => {
        return makeUrl(`/account/${id}/update`);
    },
    deactivateAccount: (id) => {
        return makeUrl(`/account/${id}/deactivate`);
    },
    getBalance: () => {
        return makeUrl('/balance')
    },
    transactions: () => {
        return makeUrl('/transactions')
    },
    doDeposit:()=>{
        return makeUrl('/transaction/deposit')
    },
    doWithdraw:()=>{
        return makeUrl('/transaction/withdraw')
    },
    doTransfer:()=>{
        return makeUrl('/transaction/transfer')
    }

};
