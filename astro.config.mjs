import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";
import mdx from "@astrojs/mdx";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: 'https://ahmedzahranali.github.io',
  base: '/',
  integrations: [tailwind(), mdx(), sitemap()],
  output: 'static',
});