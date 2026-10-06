import { hydrateRoot } from "react-dom/client";
import { HydratedRouter } from "react-router/dom";

hydrateRoot(
  document,
  <HydratedRouter />
);
console.log("HELLO FROM ENTRY CLIENT");
