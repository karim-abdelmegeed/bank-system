<template>
    <div>
        <div v-if="isRTL">
         <b-btn class="btn-info" style="float: right" @click="AddTransferTransactions()">{{$t('add_transfer_transaction')}}</b-btn>
        </div>
        <div v-else>
            <b-btn class="btn-info" @click="AddTransferTransactions()">{{$t('add_transfer_transaction')}}</b-btn>
        </div>
        <b-table id="transfers" striped hover :items="transferTransactions" :fields="fields">
            <template v-slot:cell(action)="row">
                <button class="btn btn-sm btn-warning" @click="rollback(row)">Transfer Rollback</button>
            </template>
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
                    },
                    {
                        "key":"action",
                        "label":"Action"
                    }
                ],
                perPage: 10
            }
        },
        computed: {
            transferTransactions() {
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
            isRTL() {
                return this.$rtl.isRTL;
            },


        },
        methods: {
            AddTransferTransactions() {
                this.$router.push({name: 'transaction-add', params: {type: 'transfer'}});
            },
            rollback(row){
                console.log(row);
                this.$store.dispatch('transferRollback',row.item.transaction_id).then((response)=>{
                    this.$store.dispatch('transactions', {type: TransactionTypes.transfer()});
                    this.$toastr.s(response.data)
                }).catch((e)=>{
                    this.$toastr.r(e.response.data)
                });
            }
        }
    }
</script>

<style scoped>

</style>
