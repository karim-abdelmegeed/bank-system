
export default {
  authenticated :(state)=>{
    return state.authenticated;
  },
  user :(state)=>{
    return state.user;
  },
  lang :(state)=>{
    return state.lang;
  },
  accounts :(state)=>{
    return state.accounts;
  },
  accountsTotal:(state)=>{
    return state.accountsTotal;
  },
  currentPage:(state)=>{
    return state.accountsCurrentPage;
  },
  accountTypes :(state)=>{
    return state.accountTypes;
  },
  banks :(state)=>{
    return state.banks;
  },
  currencies :(state)=>{
    return state.currencies;
  },

}
