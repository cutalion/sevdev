new TWTR.Widget({
    version: 2,
    type: 'search',
    search: '#idowebdev',
    interval: 6000,
    title: 'Прямая трансляция',
    subject: '#idowebdev',
    width: 400,
    height: 400,
    footer: 'присоединиться',
    theme: {
        shell: {
            background: '#8ec1da',
            color: '#000000'
        },
        tweets: {
            background: '#ffffff',
            color: '#444444',
            links: '#1985b5'
        }
    },
    features: {
        scrollbar: false,
        loop: false,
        live: true,
        hashtags: true,
        timestamp: true,
        avatars: true,
        behavior: 'all'
    }
}).render().start();