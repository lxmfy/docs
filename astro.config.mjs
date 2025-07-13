// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import { ion } from "starlight-ion-theme";

// https://astro.build/config
export default defineConfig({
	base: '/docs/',
	integrations: [
		starlight({
			title: 'LXMFy Bot Framework',
			sidebar: [
				{
					label: 'lxmfy',
					autogenerate: { directory: 'lxmfy' },
				},
			],
			plugins: [
				ion()
			]
		}),
	],
});
