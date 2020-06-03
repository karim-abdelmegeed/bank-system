
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
       state.accounts=data;
   }
}

