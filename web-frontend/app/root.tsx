import { Links, Meta, Outlet, Scripts, ScrollRestoration, isRouteErrorResponse, useRouteError } from "react-router";
import "./app.css";

export function Layout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
        <Meta />
        <Links />
      </head>
      <body className="antialiased w-screen h-screen overflow-hidden flex flex-col bg-gray-900 text-white">
        {children}
        <ScrollRestoration />
        <Scripts />
      </body>
    </html>
  );
}

export default function App() {
  return <Outlet />;
}

export function ErrorBoundary() {
  const error = useRouteError();
  let message = "Unknown error";
  if (isRouteErrorResponse(error)) {
    message = `${error.status} ${error.statusText}`;
  } else if (error instanceof Error) {
    message = error.message;
  }
  return (
    <div style={{ padding: "20px", color: "red", backgroundColor: "black", width: "100%", height: "100%" }}>
      <h1>React Error!</h1>
      <pre>{message}</pre>
    </div>
  );
}
