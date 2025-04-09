const { app, BrowserWindow, Menu } = require('electron')
const path = require('path')

let mainWindow

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: false,  // Sécurisé, empêche l'exécution de code Node.js dans le rendu
      preload: path.join(__dirname, 'preload.js')  // Si vous avez besoin de communication entre le rendu et Node.js
    },
  })
  mainWindow.webContents.openDevTools();


  // Charger l'application React en mode développement ou production
  if (process.env.NODE_ENV === 'production') {
    mainWindow.loadFile(path.join(__dirname, 'build', 'index.html'))
  } else {
    mainWindow.loadURL('http://localhost:3000')  // Le port utilisé par React
  }

  // Menu personnalisé
  const template = [
    {
      label: 'Quiter',
      submenu: [
        {
          label: 'Quiter',
          accelerator: 'CmdOrCtrl+Q',
          click: () => app.quit()
        }
      ]
    }
  ]
  const menu = Menu.buildFromTemplate(template)
  Menu.setApplicationMenu(menu)

  mainWindow.on('closed', () => {
    mainWindow = null
  })
}

app.on('ready', createWindow)

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
