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
    checkAuth: () => {
        return makeUrl("/token/check");
    },
    accounts: () => {
        return makeUrl("/accounts");
    }
};
