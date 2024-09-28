import adapter from '@sveltejs/adapter-static';
import * as path from 'path';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter(),
    paths: {
      relative:false
    },
    alias: {
      src: path.resolve('./src'),
      $components: path.resolve('src/lib/components')
    }    
  }
};

export default config;