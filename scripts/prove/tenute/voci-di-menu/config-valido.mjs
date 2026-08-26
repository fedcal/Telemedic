const config = {
  themeConfig: {
    navbar: {
      items: [
        {to: '/docs/adr', label: 'Decisioni', position: 'left'},
        {href: 'https://github.com/fedcal/Telemedic', label: 'GitHub', position: 'right'},
      ],
    },
    footer: {
      links: [
        {items: [{label: 'Guida', to: '/docs/fondamenti/come-usare-questa-guida'}]},
      ],
    },
  },
};
export default config;
