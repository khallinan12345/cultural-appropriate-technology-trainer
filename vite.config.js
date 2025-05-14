import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  base: '/cultural-appropriate-technology-trainer/', 
  server: {
    port: 3000,
    strictPort: true, // This ensures Vite fails if port 3000 isn't available
    proxy: {
      '/api': {
        target: 'http://localhost:3001',
        changeOrigin: true,
        secure: false
      }
    }
  }
});