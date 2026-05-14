import { z, defineCollection } from "astro:content";
import { glob } from "astro/loaders";

const blogSchema = z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updatedDate: z.string().optional(),
    heroImage: z.string().optional(),
    badge: z.string().optional(),
    tags: z.array(z.string()).refine(items => new Set(items).size === items.length, {message: 'tags must be unique',}).optional(),});

const storeSchema = z.object({
    title: z.string(),
    description: z.string(),
    custom_link_label: z.string(),
    custom_link: z.string().optional(),
    updatedDate: z.coerce.date(),
    pricing: z.string().optional(),
    oldPricing: z.string().optional(),
    badge: z.string().optional(),
    checkoutUrl: z.string().optional(),
    heroImage: z.string().optional(),
});

export type BlogSchema = z.infer<typeof blogSchema>;
export type StoreSchema = z.infer<typeof storeSchema>;

// The old v5 declarations were deleted from here!

export const collections = {
    'blog': defineCollection({
        loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/blog" }),
        schema: blogSchema
    }),
    'store': defineCollection({
        loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/store" }),
        schema: storeSchema
    })
};