<template>
    <div v-if="authenticated">
        <router-view :key="$route.fullPath"></router-view>
    </div>
    <div v-else>
        <Login></Login>
    </div>
</template>

<script>
    import Login from "./pages/Login";

    export default {
        components:{
          Login
        },
        methods: {
            disableRTL() {
                if (!this.$rtl.isRTL) {
                    this.$rtl.disableRTL();
                }
            },
            toggleNavOpen() {
                let root = document.getElementsByTagName('html')[0];
                root.classList.toggle('nav-open');
            }
        },
        mounted() {
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token');
            this.$watch('$route', this.disableRTL, {immediate: true});
            this.$watch('$sidebar.showSidebar', this.toggleNavOpen)
        },
        computed: {
            authenticated() {
                return this.$store.getters.authenticated
            }
        }
    };
</script>

