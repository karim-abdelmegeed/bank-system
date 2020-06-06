<template>
    <div>
        <div class="col-md-6">
            <pie-chart @update="showAccounts"></pie-chart>
        </div>
        <div class="col-md-6" v-show="show">
            <div class="card" v-for="account in banks[0].accounts">
                <div class="card-body">
                    <div> Account Number is {{account.account_number}}</div>
                    <div>
                        Account Balance is {{account.balance}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import PieChart from "../../components/Charts/PieChart";

    export default {
        name: "PieGraph",
        components: {PieChart},
        data() {
            return {
                show: false
            }
        },
        computed: {
            banks() {
                return this.$store.getters.banks;
            }
        },
        methods: {
            showAccounts() {
                this.show = true
            }
        }
    }
</script>

<style scoped>

</style>
