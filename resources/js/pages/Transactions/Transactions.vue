<template>
    <div>
        <div>
            <label class="label">{{$t('deposit_transactions')}}</label>
                <deposit-transactions></deposit-transactions>
        </div>
        <div>
            <label class="label"> {{$t('withdraw_transactions')}}</label>
            <with-draw-transactions></with-draw-transactions>
        </div>
        <div>
            <label class="label">{{$t('transfer_transactions')}}</label>
            <TransferTransactions></TransferTransactions>
        </div>
    </div>
</template>

<script>
    import DepositTransactions from "./DepositTransactions";
    import WithDrawTransactions from "./WithDrawTransactions";
    import TransferTransactions from "./TransferTransactions";

    export default {
        name: "Transactions",
        components: {TransferTransactions, WithDrawTransactions, DepositTransactions},
       computed:{
           isRTL() {
               return this.$rtl.isRTL;
           }
       }
    }
</script>

<style scoped>
    label.label {
        color: white !important;

    }
</style>
