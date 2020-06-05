<template>
    <div class="row">
        <button class="btn btn-outline-info" @click="addAccount">Add Account</button>
        <b-table id="accounts" striped hover :items="accounts" :fields="fields">
            <template v-slot:cell(actions)="row">
                <button class="btn btn-sm btn-info" @click="editAccount(row)">Edit</button>
                <div v-if="row.item.activated===1">
                    <button class="btn btn-sm btn-danger"
                            v-show="row.item.activated===1"
                            @click="deactivateAccount(row)">
                        Deactivate
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
                        "label": "Bank"
                    },
                    {
                        "key": "account_type.name",
                        "label": "Account Type"
                    },
                    {
                        "key": "balance",
                        "label": "Balance"
                    },
                    {
                        "key": "currency.name",
                        "label": "Currency"
                    },
                    {
                        "key": "branch",
                        "label": "Branch"
                    },
                    {
                        "key": "account_number",
                        "label": "Account Number"
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
            }
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
