<template>
    <div>
        <b-btn class="btn-info" @click="AddDepositTransactions()">Add Deposit Transaction</b-btn>
        <b-table id="deposits" striped hover :items="depositTransactions" :fields="fields">
        </b-table>
        <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="deposits"
        ></b-pagination>
    </div>
</template>

<script>
    import TransactionTypes from "../../helpers/TransactionTypes";

    export default {
        name: "DepositTransactions",
        mounted() {
            this.$store.dispatch('transactions', {type: TransactionTypes.deposit()});
        },
        data() {
            return {
                fields: [
                    {
                        key: 'date',
                        label: 'Date'
                    },
                    {
                        "key": "from_account.bank.name",
                        "label": "Bank"
                    },
                    {
                        "key": "amount",
                        "label": "Amount Payed"
                    },
                    {
                        "key": "currency.name",
                        "label": "payed Currency"
                    },
                    {
                        "key": "from_account.balance",
                        "label": "Account Balance"
                    },
                    {
                        "key": "from_account.currency.name",
                        "label": "Account currency"
                    }
                ],
                perPage: 10
            }
        },
        computed: {
            depositTransactions() {
                return this.$store.getters.depositTransactions
            },
            rows() {
                return this.$store.getters.depositTransactionsTotal;
            },
            currentPage: {
                set(value) {
                    this.$store.commit('updateDepositTransactionsCurrentPage', value);
                },
                get() {
                    return this.$store.getters.depositTransactionsCurrentPage;
                }
            },
            methods:{
                AddDepositTransactions(){
                    
                }
            }

        }
    }
</script>

<style scoped>

</style>
