<template>
    <div>
        <div>
            <label class="label"> Deposit Transactions</label>
            <deposit-transactions></deposit-transactions>
        </div>
        <div>
            <label class="label"> Withdraw Transactions</label>
            <with-draw-transactions></with-draw-transactions>
        </div>
        <div>
            <label class="label"> Transfer Transactions</label>
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
        components: {TransferTransactions, WithDrawTransactions, DepositTransactions}
    }
</script>

<style scoped>
    label.label {
        color: white !important;

    }
</style>
