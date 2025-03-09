import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  base: '/front-peli/',
  server: {
    proxy: {
      '/api': {
        target: 'http://82.25.68.70:4000',
        changeOrigin: true,
        secure: false, // Permite HTTP sin SSL
      }
    }
  }
})
