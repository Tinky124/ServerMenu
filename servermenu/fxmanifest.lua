fx_version 'cerulean'

game 'gta5'
name 'servermenu'
author 'Sefik#0615'
use_fxv2_oal 'yes'
lua54 'yes'
server_scripts {
    'server.lua',
    'config.lua'
}

client_scripts {
    'client.lua',
    'config.lua'
}

ui_page 'html/index.html'

files {
    "html/slike/*.png",
    "html/index.html",
    "html/css.css",
    "html/javascript/*.js",
}
