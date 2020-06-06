export default {
    authenticated: (state) => {
        return state.authenticated;
    },
    user: (state) => {
        return state.user;
    },
    lang: (state) => {
        return state.lang;
    },
    accounts: (state) => {
        return state.accounts;
    },
    accountsTotal: (state) => {
        return state.accountsTotal;
    },
    currentPage: (state) => {
        return state.accountsCurrentPage;
    },
    accountTypes: (state) => {
        return state.accountTypes;
    },
    banks: (state) => {
        return state.banks;
    },
    currencies: (state) => {
        return state.currencies;
    },
    depositTransactions: (state) => {
        return state.depositTransactions;
    },
    depositTransactionsTotal: (state) => {
        return state.depositTransactionsTotal;
    },
    depositTransactionsCurrentPage(state){
        return state.depositTransactionsCurrentPage;
    } ,
    withdrawTransactions: (state) => {
        return state.withdrawTransactions;
    },
    withdrawTransactionsTotal: (state) => {
        return state.withdrawTransactionsTotal;
    },
    withdrawTransactionsCurrentPage(state){
        return state.withdrawTransactionsCurrentPage;
    }  ,
    transferTransactions: (state) => {
        return state.transferTransactions;
    },
    transferTransactionsTotal: (state) => {
        return state.transferTransactionsTotal;
    },
    transferTransactionsCurrentPage(state){
        return state.transferTransactionsCurrentPage;
    }


}
