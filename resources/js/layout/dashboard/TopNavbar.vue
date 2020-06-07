<template>
    <nav class="navbar navbar-expand-lg navbar-absolute"
         :class="{'bg-white': showMenu, 'navbar-transparent': !showMenu}">
        <div class="container-fluid">
            <div class="navbar-wrapper">
                <div class="navbar-toggle d-inline" :class="{toggled: $sidebar.showSidebar}">
                    <button type="button"
                            class="navbar-toggler"
                            aria-label="Navbar toggle button"
                            @click="toggleSidebar">
                        <span class="navbar-toggler-bar bar1"></span>
                    </button>
                </div>
            </div>
            <button class="navbar-toggler" type="button"
                    @click="toggleMenu"
                    data-toggle="collapse"
                    data-target="#navigation"
                    aria-controls="navigation-index"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-bar navbar-kebab"></span>
                <span class="navbar-toggler-bar navbar-kebab"></span>
                <span class="navbar-toggler-bar navbar-kebab"></span>
            </button>

            <collapse-transition>
                <div class="collapse navbar-collapse show" v-show="showMenu">
                    <ul class="navbar-nav" :class="$rtl.isRTL ? 'mr-auto' : 'ml-auto'">
                        <div class="search-bar input-group" @click="searchModalVisible = true">
                        </div>
                        <base-dropdown tag="li"
                                       :menu-on-right="!$rtl.isRTL"
                                       title-tag="a"
                                       class="nav-item"
                                       menu-classes="dropdown-navbar">
                            <a slot="title" href="#" data-toggle="dropdown" aria-expanded="true">
                                <div class="photo">
                                    <img src="/img/anime3.png">
                                </div>
                                <p class="d-lg-none">
                                    Log out
                                </p>
                            </a>
                            <li class="nav-link">
                                <button @click="switchLanguage()" class="nav-item dropdown-item">{{language}}</button>
                            </li>

                            <div class="dropdown-divider"></div>
                            <li class="nav-link">
                                <button class="nav-item dropdown-item" @click="logout">Log out</button>
                            </li>
                        </base-dropdown>
                    </ul>
                </div>
            </collapse-transition>
        </div>
    </nav>
</template>
<script>
    import {CollapseTransition} from 'vue2-transitions';
    import Modal from '@/components/Modal';
    import apiUrls from "../../helpers/apiUrls";

    export default {
        components: {
            CollapseTransition,
            Modal
        },
        beforeMount() {
          if(localStorage.getItem('lang')==="ar"){
              this.$rtl.enableRTL();
              this.$i18n.locale="ar";
          }
          else{
              this.$rtl.disableRTL();
              this.$i18n.locale="en";
          }
        },
        data() {
            return {
                showMenu: false
            }
        },
        computed: {
            routeName() {
                const {name} = this.$route;
                return this.capitalizeFirstLetter(name);
            },
            isRTL() {
                return this.$rtl.isRTL;
            },
            language() {
                return this.isRTL ? 'English' : 'العربية'
            }
        },
        methods: {
            capitalizeFirstLetter(string) {
                return string.charAt(0).toUpperCase() + string.slice(1);
            },
            toggleNotificationDropDown() {
                this.activeNotifications = !this.activeNotifications;
            },
            closeDropDown() {
                this.activeNotifications = false;
            },
            toggleSidebar() {
                this.$sidebar.displaySidebar(!this.$sidebar.showSidebar);
            },
            hideSidebar() {
                this.$sidebar.displaySidebar(false);
            },
            toggleMenu() {
                this.showMenu = !this.showMenu;
            },
            logout() {
                axios.post(apiUrls.logout()).then((response) => {
                    this.$toastr.s(response.data);
                    this.$router.push("login");
                });
            },
            switchLanguage() {
                if(this.isRTL) {
                    localStorage.setItem('lang','en');
                }
                else{
                    localStorage.setItem('lang','ar');
                }
                window.location.href=this.$route.path
            }
        }
    };
</script>
<style>
</style>
