
# purescript-node-http Hello World

My 'Hello World' trial of https://github.com/purescript-node/purescript-node-http

    bower i
    pulp build

    # Start single instance
    pulp run

    # Or start a cluster with pm2
    pm2 start app.js -i 4 --name "app"

# Learnings

- purescript-node-http is a very low level library - wrapping nodejs' OO mutating api
- This makes it quite unsafe to use. 
- I'd probably look for something else for writing apps.