<template>
    <div class="row">
        <button class="btn btn-outline-info">Add</button>
        <b-table striped hover :items="accounts" :fields="fields">
            <template v-slot:cell(actions)="row">
                <button class="btn btn-info">Edit</button>
                <button class="btn btn-danger">Deactivate</button>
            </template>
        </b-table>
        <b-pagination
            v-model="currentPage"
            :total-rows="rows"
            :per-page="perPage"
            aria-controls="my-table"
        ></b-pagination>
    </div>
</template>

<script>
    export default {
        name: "Accounts",
        data(){
            return{
                fields:[
                    {
                        "key":"bank.name",
                        "label":"Bank"
                    },
                    {
                        "key":"account_type.name",
                        "label":"Account Type"
                    },
                    {
                        "key":"balance",
                        "label":"Balance"
                    },
                    {
                        "key":"currency.name",
                        "label":"Currency"
                    },
                    {
                        "key":"branch",
                        "label":"Branch"
                    },
                    {
                        "key":"account_number",
                        "label":"Account Number"
                    },
                    { key: 'actions', label: 'Actions' }
                ],
                currentPage:1,
                perPage:10
            }
        },
        mounted() {
            this.$store.dispatch('accounts');
        },
        computed: {
            accounts() {
                return this.$store.getters.accounts
            },
            rows(){
                return this.accounts.length;
            }
        }
    }
</script>

<style scoped>

</style>
