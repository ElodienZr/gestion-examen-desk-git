// preload.js
const { contextBridge } = require('electron')

contextBridge.exposeInMainWorld('electron', {
  myFunction: () => {
    // Code Node.js ici
    console.log('Fonction de Node.js exposée à React')
  }
})
