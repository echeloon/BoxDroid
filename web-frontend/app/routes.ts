import {
    type RouteConfig,
    index,
    route,
} from "@react-router/dev/routes";
  
export default [
    index("routes/_index.tsx"),
    route("library", "routes/library.tsx"),
    route("settings", "routes/settings.tsx"),
] satisfies RouteConfig;
