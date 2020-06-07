<template>
    <div class="container">
        <div>
            <b-btn class="btn btn-primary" v-show="!show" @click="addOperation">add more operation</b-btn>
            <div class="card" v-for="(operation,key) in operations">
                <div class="card-header">
                    Add Bank Account
                </div>
                <div class="card-body">
                    <div>
                        <label>Add Amount</label>
                        <input class="form-control" type="text" placeholder="Add Amount" v-model="amount[key]"/>
                        <span class="error">{{amountError}}</span>
                    </div>
                    <div>
                        <label>select Account</label>
                        <multiselect v-model="selectedAccount"
                                     :options="accounts"
                                     placeholder="Select Account Number"
                                     :searchable="true"
                                     :allow-empty="false"
                                     label="account_number"
                        >

                        </multiselect>
                        <span class="error">{{accountsError}}</span>

                    </div>
                    <div v-show="show">
                        <label>select Account to transfer</label>
                        <multiselect v-model="selectedAccountTo"
                                     :options="accounts"
                                     :searchable="true"
                                     :allow-empty="false"
                                     label="account_number"
                        >

                        </multiselect>
                        <span class="error">{{accountsError}}</span>

                    </div>
                    <div>
                        <label>select Currency</label>
                        <multiselect v-model="selectedCurrency[key]"
                                     :options="currencies"
                                     placeholder="Select Currency"
                                     :searchable="true"
                                     :allow-empty="false"
                                     label="name"
                        >

                        </multiselect>
                        <span class="error">{{currencyError}}</span>

                    </div>
                </div>
                <div class="card-footer"></div>
            </div>
            <b-btn class="btn btn-info" @click="submit">submit transaction</b-btn>

        </div>
    </div>

</template>

<script>
    import Multiselect from 'vue-multiselect';

    export default {
        name: "AddTransaction",
        components: {Multiselect},
        data() {
            return {
                operationType: null,
                currencyError: null,
                accountsError: null,
                amountError: null,
                amount: [],
                selectedCurrency: [],
                selectedAccount: null,
                selectedAccountTo: null,
                operations: 1,
                show: false
            }
        },
        mounted() {
            this.operationType = this.$route.params.type
            if (this.operationType === "transfer") {
                this.show = true
            }

            this.$store.dispatch('accounts');
        },
        computed: {
            currencies() {
                return this.$store.getters.currencies;
            },
            user() {
                return this.$store.getters.user;
            },
            accounts() {
                return this.$store.getters.accounts;
            }
        },
        methods: {
            addOperation() {
                this.operations++;
            },
            submit() {
                var selectedCurrency = this.selectedCurrency.map((currency) => {
                    return currency.id
                });
                var data = {
                    'amount': this.amount,
                    'currency_id': selectedCurrency,
                    'from_account': this.selectedAccount,
                    'to_account': this.selectedAccountTo
                }
                if (this.operationType === "withdraw") {
                    this.$store.dispatch('doWithdraw', {data}).then((response) => {
                        this.$toastr.s("operation is done successfully")
                    });
                } else if (this.operationType === "deposit") {
                    this.$store.dispatch('doDeposit', {data}).then((response) => {
                        this.$toastr.s("operation is done successfully")
                    });
                } else {
                    this.$store.dispatch('doTransfer', {data}).then((response) => {
                        this.$toastr.s("operation is done successfully")
                    });
                }
                this.$router.push({'name': 'transactions'});

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
