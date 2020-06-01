<template>
    <card>
        <form>
            <base-input label="Email address"
                        type="email"
                        placeholder="Enter email"
                        v-model="email"

            >
            </base-input>
            <base-input label="Password"
                        type="password"
                        placeholder="Password"
                        v-model="password"
            >
            </base-input>
            <base-button native-type="button" type="primary" @click="LoginForm">Submit</base-button>
        </form>
    </card>
</template>
<script>
    import apiUrls from '../helpers/apiUrls';

    export default {
        name: 'Login',
        data() {
            return {
                email: null,
                password: null
            }
        },
        methods: {
            LoginForm() {
                axios.post(apiUrls.login(), {
                    email: this.email,
                    password: this.password
                })
                    .then((response) => {
                        console.log(response.data)
                        if (response.data) {
                            this.$store.commit('userUpdate', response.data.user);
                            this.$store.commit('authenticatedValue', true);
                            localStorage.setItem('access_token', response.data.access_token);
                            if (localStorage.getItem('lang') == null) {
                                localStorage.setItem('lang', 'en');
                                this.$i18n.locale = 'en';
                                this.$rtl.disableRTL();
                            } else {
                                var lang = localStorage.getItem('lang');
                                if (lang === "ar") {
                                    this.$i18n.locale = 'ar';
                                    this.$rtl.enableRTL();
                                } else {
                                    this.$i18n.locale = 'en';
                                    this.$rtl.disableRTL();
                                }
                            }
                            axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token');
                            this.$router.push('/dashboard');
                        }
                    }).catch((error) => {
                    if (error.response.status === 401) {
                        toastr.error('Unauthorized check your email or password')
                    }
                });

            }
        },
        computed: {
            isRTL() {
                return this.$rtl.isRTL;
            }
        }
    }
</script>
<style>
    div.card {
        margin-top: 50px !important;
    }
</style>
