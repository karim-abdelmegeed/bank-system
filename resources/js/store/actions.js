import apiUrls from "../helpers/apiUrls";
import TransactionTypes from "../helpers/TransactionTypes";

export default {
    accounts({commit}, page = 1) {
        return axios.get(apiUrls.accounts(), {
            params: {
                page
            }
        })
            .then((response) => {
                commit('updateAccounts', response.data);
            })
    },
    accountTypes({commit}) {
        axios.get(apiUrls.accountTypes()).then((response) => {
            commit('updateAccountTypes', response.data.data)
        });
    },
    banks({commit}, data) {
        if (data) {
            axios.get(apiUrls.banks(),
                {
                    params: {
                        "filter_by": data.filter_by,
                        "filter_value": data.filter_value,
                    }
                })
                .then((response) => {
                    commit('updateBanks', response.data)
                });
        } else {
            axios.get(apiUrls.banks())
                .then((response) => {
                    commit('updateBanks', response.data.data)
                });
        }

    },
    currencies({commit}) {
        axios.get(apiUrls.currencies()).then((response) => {
            commit('updateCurrencies', response.data.data)
        });
    },
    addAccount({commit}, data) {
        return axios.post(apiUrls.addAccount(), {data})
    },
    updateAccount({commit}, data) {
        return axios.put(apiUrls.updateAccount(data.id), {data})
    },
    deactivateAccount({commit}, id) {
        return axios.post(apiUrls.deactivateAccount(id))
    },
    getBalance({commit}) {
        return axios.get(apiUrls.getBalance())
    },
    transactions({commit}, data) {
        axios.get(apiUrls.transactions(), {
            params: {
                'type': data.type
            }
        }).then((response) => {
            console.log(response.data)
            if (data.type === TransactionTypes.deposit()) {
                commit('updateDepositTransactions', response.data.data)
                commit('updateDepositTransactionsTotal', response.data.total)
            }
            if (data.type === TransactionTypes.transfer()) {
                commit('updateTransferTransactions', response.data.data)
                commit('updateTransferTransactionsTotal', response.data.total)
            }
            if (data.type === TransactionTypes.withdraw()) {
                commit('updateWithdrawTransactions', response.data.data)
                commit('updateWithdrawTransactionsTotal', response.data.total)
            }
        })
    },
    doWithdraw({commit}, data) {
        return axios.post(apiUrls.doWithdraw(), {data});
    },
    doDeposit({commit},data){
        return axios.post(apiUrls.doDeposit(),{data});
    },
    doTransfer({commit},data){
        return axios.post(apiUrls.doTransfer(),{data});
    }
}
