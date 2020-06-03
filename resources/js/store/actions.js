import apiUrls from "../helpers/apiUrls";

export default {
    accounts({commit}) {
        axios.get(apiUrls.accounts()).then((response) => {
            console.log(response.data.data);
            commit('updateAccounts',response.data.data)
        });
    }

}
