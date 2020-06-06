import {Pie} from 'vue-chartjs'

export default {
    extends: Pie,
    mounted() {
        this.$store.dispatch('getBalance').then((response) => {
            this.labels = Object.keys(response.data);
            this.dataSet = Object.values(response.data);
            this.render();
        });
    },
    methods: {
        render() {
            this.renderChart(
                {
                    labels: this.labels,
                    datasets: [
                        {
                            backgroundColor: ['#f3c623', '#d1eaa3', '#dbc6eb', '#abc2e8'],
                            data: this.dataSet
                        }
                    ]
                }
                , {
                    responsive: true, maintainAspectRatio: false,
                    onClick: this.handle
                })
        },
        handle(point, event) {
            if (event[0]) {
                this.$store.dispatch('banks',
                    {
                        'filter_by': 'name',
                        'filter_value': event[0]._model.label
                    }).then(()=>{
                        this.$emit('update');
                })

            }
        }
    }
}
