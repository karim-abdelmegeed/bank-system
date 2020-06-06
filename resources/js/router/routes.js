import DashboardLayout from "@/layout/dashboard/DashboardLayout.vue";
import NotFound from "@/pages/NotFoundPage.vue";
import Accounts from "../pages/Accounts/Accounts";
import Login from "../pages/Login";
import PieGraph from "../pages/Balance/Balance";
import Transactions from "../pages/Transactions/Transactions";

const routes = [
    {
        path: "/",
        component: DashboardLayout,
        redirect: "/accounts",
        children: [
            {
                path: "/accounts",
                name: "accounts",
                component: Accounts
            },
            {
                path: "/balance",
                name: "balance",
                component: PieGraph
            },
            {
                path: "/transactions",
                name: "transactions",
                component: Transactions
            }

        ]

    },
    {path: "/login", name: "login", component: Login},
    {path: "*", component: NotFound},
];

export default routes;
