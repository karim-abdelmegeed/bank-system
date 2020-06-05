
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
}

