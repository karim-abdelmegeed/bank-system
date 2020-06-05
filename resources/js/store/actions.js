import apiUrls from "../helpers/apiUrls";

export default {
    accounts({commit}, page=1) {
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
    banks({commit}) {
        axios.get(apiUrls.banks()).then((response) => {
            commit('updateBanks', response.data.data)
        });
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
    }
}
