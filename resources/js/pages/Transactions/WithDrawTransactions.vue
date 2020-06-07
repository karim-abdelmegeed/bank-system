<template>
    <div>
        <div v-if="isRTL">
            <b-btn class="btn-info" style="float: right" @click="AddWithDrawTransactions()">{{$t('add_withdraw_transaction')}}</b-btn>
        </div>
        <div v-else>
            <b-btn class="btn-info" @click="AddWithDrawTransactions()">{{$t('add_withdraw_transaction')}}</b-btn>
        </div>
        <b-table id="withdraw" striped hover :items="withdrawTransactions" :fields="fields">
        </b-table>
        <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="withdraw"
        ></b-pagination>
    </div>
</template>

<script>
    import TransactionTypes from "../../helpers/TransactionTypes";
    export default {
        name: "WithDrawTransactions",
        mounted() {
            this.$store.dispatch('transactions', {type: TransactionTypes.withdraw()});
        },
        data() {
            return {
                fields: [
                    {
                        key:"Date",
                        label: "Date"
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
            withdrawTransactions() {
                return this.$store.getters.withdrawTransactions
            },
            rows() {
                return this.$store.getters.withdrawTransactionsTotal;
            },
            currentPage: {
                set(value) {
                    this.$store.commit('updateWithdrawTransactionsCurrentPage', value);
                },
                get() {
                    return this.$store.getters.withdrawTransactionsCurrentPage;
                }
            },
            isRTL() {
                return this.$rtl.isRTL;
            },


        },
        methods:{
            AddWithDrawTransactions(){
             this.$router.push({name:'transaction-add', params: {type: 'withdraw'}})
            }
        }
    }
</script>

<style scoped>

</style>
