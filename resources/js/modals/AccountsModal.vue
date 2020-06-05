<template>
    <div>
        <modal name="account-modal"
               @before-open="beforeOpen"
               @before-close="beforeClose()"
               height="auto"
               :adaptive="true"
               :scrollable="true"
               :close-on-click-modal="false"
        >
            <div class="container">
                <div class="card">
                    <div class="card-header">
                        Add Bank Account
                    </div>
                    <div class="card-body">
                        <div>
                            <label>select Account Type</label>
                            <multiselect v-model="selectedAccountType"
                                         :options="accountTypes"
                                         label="name"
                                         track-by="id"
                                         placeholder="Select Account Type"
                                         :searchable="true"
                                         :allow-empty="false"
                            >
                            </multiselect>
                            <span class="error">{{accountTypeError}}</span>
                        </div>
                        <div>
                            <label>select Bank</label>
                            <multiselect v-model="selectedBank"
                                         :options="banks"
                                         label="name"
                                         placeholder="Select Bank"
                                         :searchable="true"
                                         :allow-empty="false"
                            >

                            </multiselect>
                            <span class="error">{{bankError}}</span>
                        </div>
                        <div>
                            <label>select Currency</label>
                            <multiselect v-model="selectedCurrency"
                                         :options="currencies"
                                         placeholder="Select Currency"
                                         :searchable="true"
                                         :allow-empty="false"
                                         label="name"
                            >

                            </multiselect>
                            <span class="error">{{currencyError}}</span>

                        </div>
                        <div>
                            <label>select Branch</label>
                            <input class="form-control" type="text" placeholder="Add Branch" v-model="branch"/>
                            <span class="error">{{branchError}}</span>
                        </div>
                        <div>
                            <label>select Account Number</label>
                            <input class="form-control" type="text" placeholder="Add Account Number"
                                   v-model="account_number"/>
                            <span class="error">{{accountNumberError}}</span>

                        </div>
                        <div>
                            <label>select Balance</label>
                            <input class="form-control" type="text" placeholder="Add Balance" v-model="balance"/>
                            <span class="error">{{balanceError}}</span>

                        </div>
                    </div>
                    <div class="card-footer">
                        <div>
                            <button class="btn btn-success" @click="submit">submit</button>
                        </div>
                    </div>


                </div>
            </div>
        </modal>
    </div>
</template>

<script>
    import Multiselect from 'vue-multiselect';

    export default {
        name: "AccountsModal",
        components: {Multiselect},
        mounted() {
            this.$store.dispatch('accountTypes')
            this.$store.dispatch('banks')
            this.$store.dispatch('currencies')
        },
        data() {
            return {
                id: null,
                selectedAccountType: null,
                selectedBank: null,
                selectedCurrency: null,
                branch: null,
                account_number: null,
                balance: null,
                accountTypeError: null,
                bankError: null,
                currencyError: null,
                branchError: null,
                balanceError: null,
                accountNumberError: null
            }
        },
        computed: {
            user() {
                return this.$store.getters.user;
            },
            banks() {
                return this.$store.getters.banks;
            },
            accountTypes() {
                return this.$store.getters.accountTypes;
            },
            currencies() {
                return this.$store.getters.currencies;
            },
        },
        methods: {
            beforeOpen(e) {
                if (e.params) {
                    this.id = e.params.account.id;
                    this.selectedBank = e.params.account.bank;
                    this.selectedCurrency = e.params.account.currency;
                    this.selectedAccountType = e.params.account.account_type;
                    this.balance = e.params.account.balance;
                    this.branch = e.params.account.branch;
                    this.branch = e.params.account.branch;
                    this.account_number = e.params.account.account_number;
                }
            },
            submit() {
                var account = {
                    'id':this.id,
                    'bank_id': this.selectedBank ? this.selectedBank.id : null,
                    'account_type_id': this.selectedAccountType ? this.selectedAccountType.id : null,
                    'currency_id': this.selectedCurrency ? this.selectedCurrency.id : null,
                    'branch': this.branch,
                    'account_number': this.account_number,
                    'balance': this.balance,
                    'user_id': this.user.id
                }
                if(this.id){
                    this.$store.dispatch('updateAccount', account)
                        .then(response => {
                            this.$store.dispatch('accounts');
                            this.$store.commit('updateAccountsCurrentPage',1);
                            this.resetProps();
                            this.$modal.hide('account-modal');
                            this.$toastr.defaultTimeout = 5000;
                            this.$toastr.s("Account Updated successfully");
                        }).catch(error => {
                        if (error.response.status === 422) {
                            this.$toastr.e("error while updating account");
                            this.handleValidationErrors(error);
                        }
                    })
                }
                else{
                    this.$store.dispatch('addAccount', account)
                        .then(response => {
                            this.$store.dispatch('accounts');
                            this.$store.commit('updateAccountsCurrentPage',1);
                            this.resetProps();
                            this.$modal.hide('account-modal');
                            this.$toastr.defaultTimeout = 5000;
                            this.$toastr.s("Account Updated successfully");
                        }).catch(error => {
                        if (error.response.status === 422) {
                            this.$toastr.e("error while add new account");
                            this.handleValidationErrors(error);
                        }
                    })
                }
            },
            beforeClose(){
                this.resetProps();
            },
            handleValidationErrors(error) {
                if ("account_type_id" in error.response.data) {
                    this.accountTypeError = error.response.data.account_type_id[0]
                } else {
                    this.accountTypeError = null;
                }
                if ("bank_id" in error.response.data) {
                    this.bankError = error.response.data.bank_id[0]
                } else {
                    this.bankError = null;
                }
                if ("currency_id" in error.response.data) {
                    this.currencyError = error.response.data.currency_id[0]
                } else {
                    this.currencyError = null;
                }
                if ("balance" in error.response.data) {
                    this.balanceError = error.response.data.balance[0]
                } else {
                    this.balanceError = null;
                }
                if ("account_number" in error.response.data) {
                    this.accountNumberError = error.response.data.account_number[0]
                } else {
                    this.accountNumberError = null;
                }
                if ("branch" in error.response.data) {
                    this.branchError = error.response.data.branch[0]
                } else {
                    this.branchError = null;
                }
            },
            resetProps() {
                this.id = null
                this.selectedAccountType = null
                this.selectedBank = null
                this.selectedCurrency = null
                this.branch = null
                this.account_number = null
                this.balance = null
                this.accountTypeError = null
                this.bankError = null
                this.currencyError = null
                this.branchError = null
                this.balanceError = null
                this.accountNumberError = null
            }
        }
    }
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
<style>
    .multiselect__option {
        color: #222a42 !important;
    }

    .error {
        color: red;
    }

    .card .card-header:not([data-background-color]) {
        color: #1e1e24;
    }
</style>
