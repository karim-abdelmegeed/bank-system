<template>
    <div>
        <b-btn class="btn-info" @click="AddTransferTransactions()">Add Transfer Transaction</b-btn>
        <b-table id="transfers" striped hover :items="transferTransactions" :fields="fields">
        </b-table>
        <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="transfers"
        ></b-pagination>
    </div>
</template>

<script>
    import TransactionTypes from "../../helpers/TransactionTypes";

    export default {
        name: "TransferTransactions",
        mounted() {
            this.$store.dispatch('transactions', {type: TransactionTypes.transfer()});
        },
        data() {
            return {
                fields: [
                    {
                        key: 'Date',
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
                return this.$store.getters.transferTransactions
            },
            rows() {
                return this.$store.getters.transferTransactionsTotal;
            },
            currentPage: {
                set(value) {
                    this.$store.commit('updateTransferTransactionsCurrentPage', value);
                },
                get() {
                    return this.$store.getters.transferTransactionsCurrentPage;
                }
            },

        },
        methods: {
            AddTransferTransactions() {
                this.$router.push({name: 'transaction-add', params: {type: 'transfer'}});
            }
        }
    }
</script>

<style scoped>

</style>
