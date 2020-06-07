<template>
    <div>
        <div v-if="isRTL">
         <b-btn class="btn-info" @click="AddDepositTransactions()" style="float: right">{{$t('add_deposit_transaction')}}</b-btn>
        </div>
        <div v-else>
            <b-btn class="btn-info" @click="AddDepositTransactions()">{{$t('add_deposit_transaction')}}</b-btn>
        </div>
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
                        key: 'Date',
                        label: this.$t('date')
                    },
                    {
                        "key": "from_account.bank.name",
                        "label": this.$t('bank')
                    },
                    {
                        "key": "amount",
                        "label": this.$t("amount_payed")
                    },
                    {
                        "key": "currency.name",
                        "label": this.$t("payed_currency")
                    },
                    {
                        "key": "from_account.balance",
                        "label": this.$t("account_balance")
                    },
                    {
                        "key": "from_account.currency.name",
                        "label": this.$t("account_currency")
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
            isRTL() {
                return this.$rtl.isRTL;
            },
        },
        methods: {
            AddDepositTransactions() {
                this.$router.push({name: 'transaction-add', params: {type: 'deposit'}});
            }
        }
    }
</script>

<style scoped>

</style>
