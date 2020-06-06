<template>
    <modal name="withdraw-modal"
           @before-open="beforeOpen"
           @before-close="beforeClose()"
           height="auto"
           :adaptive="true"
           :scrollable="true"
           :close-on-click-modal="false"
    >
        <div class="container">
            <div class="card">
                <div class="card-header">
                    Add Withdraw Transaction
                </div>
                <div class="card-body">
                    <div>
                        <label>select Currency</label>
                        <multiselect v-model="selectedCurrency"
                                     :options="currencies"
                                     placeholder="Select Currency"
                                     :searchable="true"
                                     :allow-empty="false"
                                     label="name"
                        >

                        </multiselect>
                        <span class="error">{{currencyError}}</span>

                    </div>
                </div>
                <div class="card-footer">
                    <div>
                        <button class="btn btn-success" @click="submit">submit</button>
                    </div>
                </div>


            </div>
        </div>
    </modal>

</template>

<script>
    import Multiselect from 'vue-multiselect';
    export default {
        name: "WithDrawModal",
        components: {Multiselect},
        mounted() {
            this.$store.dispatch('currencies')
        },
        computed:{
            currencies() {
                return this.$store.getters.currencies;
            },
        }

    }
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
<style>
    .multiselect__option {
        color: #222a42 !important;
    }

    .error {
        color: red;
    }

    .card .card-header:not([data-background-color]) {
        color: #1e1e24;
    }
</style>
