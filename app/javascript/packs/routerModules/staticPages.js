import Home from "../../components/staticpages/Home";
import Help from "../../components/staticpages/Help";
import Contact from "../../components/staticpages/Contact";
import Entrance from "../../components/sessions/Entrance";
import Register from "../../components/sessions/Register";

export default [
  { path: "/", component: Home, name: "home_path" },
  { path: "/help", component: Help, name: "help_path" },
  { path: "/contact", component: Contact, name: "contact_path" },
  { path: "/entrance", component: Entrance, name: "entrance_path" },
  { path: "/register", component: Register, name: "register_path" },
];
