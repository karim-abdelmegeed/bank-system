
export default{
   authenticatedValue(state,payload){
    state.authenticated=payload;
   },
   userUpdate(state,payload){
    state.user=payload;
   },
   updateLang(state,lang){
     state.lang=lang;
   },
   updateAccounts(state,data){
       state.accounts=data.data;
       state.accountsTotal=data.total;
   },
    updateAccountsCurrentPage(state,data){
        state.accountsCurrentPage=data;
    },
   updateAccountTypes(state,data){
       state.accountTypes=data;
   },
   updateCurrencies(state,data){
       state.currencies=data;
   },
   updateBanks(state,data){
       state.banks=data;
   },
    updateDepositTransactions(state,data){
       state.depositTransactions=data;
    } ,
    updateDepositTransactionsTotal(state,data){
       state.depositTransactionsTotal=data;
    },
    updateDepositTransactionsCurrentPage(state,data){
       state.depositTransactionsCurrentPage=data;
    },
    updateTransferTransactions(state,data){
       state.transferTransactions=data;
    } ,
    updateTransferTransactionsTotal(state,data){
       state.transferTransactionsTotal=data;
    },
    updateTransferTransactionsCurrentPage(state,data){
       state.transferTransactionsCurrentPage=data;
    },
    updateWithdrawTransactions(state,data){
       state.withdrawTransactions=data;
    } ,
    updateWithdrawTransactionsTotal(state,data){
       state.withdrawTransactionsTotal=data;
    },
    updateWithdrawTransactionsCurrentPage(state,data){
       state.withdrawTransactionsCurrentPage=data;
    },
}

