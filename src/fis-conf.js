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
})