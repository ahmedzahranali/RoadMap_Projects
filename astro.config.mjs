import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";
import mdx from "@astrojs/mdx";

export default defineConfig({
  // Replace 'ahmedzahranali' and 'ROADMAP_PROJECTS' with your actual values
  site: 'https://ahmedzahranali.github.io',
  base: '/ROADMAP_PROJECTS', 
  integrations: [tailwind(), mdx()],
});