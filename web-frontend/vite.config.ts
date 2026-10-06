import { defineConfig } from 'vite'
import { reactRouter } from "@react-router/dev/vite"
import tsconfigPaths from "vite-tsconfig-paths"
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    tailwindcss(),
    reactRouter(),
    tsconfigPaths()
  ],
  build: {
    outDir: '../android/app/src/main/assets/www',
    emptyOutDir: true,
  }
})
