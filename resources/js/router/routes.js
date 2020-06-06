import DashboardLayout from "@/layout/dashboard/DashboardLayout.vue";
import NotFound from "@/pages/NotFoundPage.vue";
import Accounts from "../pages/Accounts/Accounts";
import Login from "../pages/Login";
import PieGraph from "../pages/Balance/Balance";

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
            }

        ]

    },
    {path: "/login", name: "login", component: Login},
    {path: "*", component: NotFound},
];

export default routes;
