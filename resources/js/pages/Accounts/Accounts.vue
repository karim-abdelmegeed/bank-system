<template>
    <div class="row">
        <div v-if="isRTL">
           <button class="btn btn-outline-info" style="float: right" @click="addAccount">{{$t('add_account')}}</button>
        </div>
        <div v-else>
            <button class="btn btn-outline-info" @click="addAccount">{{$t('add_account')}}</button>
        </div>
            <b-table id="accounts" striped hover :items="accounts" :fields="fields">
            <template v-slot:cell(actions)="row">
                <button class="btn btn-sm btn-info" @click="editAccount(row)">{{$t('edit')}}</button>
                <div v-if="row.item.activated===1">
                    <button class="btn btn-sm btn-danger"
                            v-show="row.item.activated===1"
                            @click="deactivateAccount(row)">
                        {{$t("deactivate")}}
                    </button>
                </div>
            </template>
        </b-table>
        <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="accounts"
        ></b-pagination>
        <accounts-modal></accounts-modal>
        <v-dialog/>
    </div>
</template>

<script>
    import AccountsModal from "../../modals/AccountsModal";

    export default {
        name: "Accounts",
        components: {AccountsModal},
        data() {
            return {
                fields: [
                    {
                        "key": "bank.name",
                        "label": this.$t('bank')
                    },
                    {
                        "key": "account_type.name",
                        "label": this.$t('account_type')
                    },
                    {
                        "key": "balance",
                        "label": this.$t('balance')
                    },
                    {
                        "key": "currency.name",
                        "label":this.$t('currency')
                    },
                    {
                        "key": "branch",
                        "label": this.$t('branch')
                    },
                    {
                        "key": "account_number",
                        "label": this.$t('account_number')
                    },
                    {key: 'actions', label: 'Actions'}
                ],
                perPage: 10
            }
        },
        mounted() {
            this.$store.dispatch('accounts')
                .catch(error => {
                    if (error.response.status === 401) {
                        this.$toastr.e("Unauthenticated");
                        this.$router.push('login')
                    }
                });
        },
        computed: {
            accounts() {
                return this.$store.getters.accounts
            },
            rows() {
                return this.$store.getters.accountsTotal;
            },
            currentPage: {
                set(value) {
                    this.$store.commit('updateAccountsCurrentPage', value);
                },
                get() {
                    return this.$store.getters.currentPage;
                }
            },
            isRTL() {
                return this.$rtl.isRTL;
            },
        },
        methods: {
            addAccount() {
                this.$modal.show('account-modal');
            },
            editAccount(row) {
                let account = row.item
                this.$modal.show('account-modal', {account});
            },
            deactivateAccount(row) {
                this.showDialog(row)
            },
            showDialog(row) {
                this.$modal.show('dialog', {
                    title: 'Alert!',
                    text: 'Are you sure you want to deactivate account',
                    buttons: [
                        {
                            title: 'Yes',
                            handler: () => {
                                let account = row.item;
                                this.$store.dispatch('deactivateAccount', account.id).then(() => {
                                    row.item.activated = 0
                                    this.$modal.hide("dialog");
                                });
                            }
                        },
                        {
                            title: 'No'
                        }
                    ]
                })
            }
        },
        watch: {
            currentPage() {
                this.$store.dispatch('accounts', this.currentPage);
            }
        }

    }
</script>

<style scoped>

</style>
