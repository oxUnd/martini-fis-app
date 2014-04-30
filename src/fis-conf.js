fis.config.set('deploy', {
    "remote": [
        {
            from: "/static",
            to: "../public/"
        },
        {
            from: "/template",
            to: ".."
        }
    ]
});

//打包规则
fis.config.set('pack', {
    'static/aio.js': '**.js',
    'static/aio.css': '**.css'
});

//配置cdn
fis.config.set('roadmap.domain', 'http://127.0.0.1:3000')