<template>

</template>

<script>
    import TransactionTypes from "../../helpers/TransactionTypes";

    export default {
        name: "TransferTransactions",
        mounted() {
            this.$store.dispatch('transactions', {type: TransactionTypes.transfer()});
        }
    }
</script>

<style scoped>

</style>
