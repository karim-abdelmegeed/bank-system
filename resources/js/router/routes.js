import DashboardLayout from "@/layout/dashboard/DashboardLayout.vue";
// GeneralViews
import NotFound from "@/pages/NotFoundPage.vue";
import Accounts from "../pages/Accounts/Accounts";

// Admin pages
const Dashboard = () => import(/* webpackChunkName: "dashboard" */"@/pages/Dashboard.vue");
const Profile = () => import(/* webpackChunkName: "common" */ "@/pages/Profile.vue");
const Notifications = () => import(/* webpackChunkName: "common" */"@/pages/Notifications.vue");
const Icons = () => import(/* webpackChunkName: "common" */ "@/pages/Icons.vue");
const Maps = () => import(/* webpackChunkName: "common" */ "@/pages/Maps.vue");

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
    ]
  },
  { path: "*", component: NotFound },
];


export default routes;
