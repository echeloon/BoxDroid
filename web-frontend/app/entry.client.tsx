import { hydrateRoot } from "react-dom/client";
import { HydratedRouter } from "react-router/dom";
import { installController } from "./controller";

installController();

hydrateRoot(
  document,
  <HydratedRouter />
);
