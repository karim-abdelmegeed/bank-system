const makeUrl = route => {
    return `http://${location.hostname}/api${route}`;
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
};
