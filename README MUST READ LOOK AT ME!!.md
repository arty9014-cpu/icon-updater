# Icon Updater  -- IMPORTANT TO END THIS TASK GO OPEN WINDOWS-> TASKMANAGER THEN GO TO THE SEARCHBAR AND SEARCH FOR NODE IF U SEE NODE AND RUNTIME AT THE END THEN SELECT IT AND CLICK END TASK.
💡TIP: If you dont wanna use a task /taskmanager the easier way is to go to public->index.html. INSTRUCTIONS: open index.html thats it.
**Made by superer325 · Discord: oncefreedomreplies**
© 2026 superer325. All rights reserved. See `LICENSE`.

Icon Updater puts an automatic countdown on your Roblox game icon. Every hour it uploads a new icon: **IN 3 HOURS → IN 2 HOURS → IN 1 HOUR**, then **NOW** at release time, with the dark background removed. The hourglass sand drains a little more with each icon.

## Start it

1. Install **Node.js 18 or newer** from https://nodejs.org.
2. **Windows:** double-click `start.bat`.
   **Mac/Linux:** open a terminal in this folder and run `node server.js`.
3. Your browser opens **http://localhost:3000**.

You don't need to run `npm install`.

> **Keep the window open.** Icons only change while the program runs. If the PC sleeps through an update, it puts up the correct icon as soon as it wakes.

## Use it

1. **Game.** Paste your Universe ID (Creator Dashboard → ⋯ → *Copy Universe ID*) or your game link, then click **Load game**.
2. **Schedule.** Pick the release time, how often the icon changes, and whether to put your original icon back afterwards.
3. **Design.** Choose a look:
   - **Classic:** white hourglass and bold white text with a soft shadow, the style big games use.
   - **Simulator:** colorful and chunky.

   You can also change the text, colors and how dark the background gets. The live preview updates as you edit.
4. **Connect.** Paste an Open Cloud API key and click **Verify**.
5. Click **Start countdown**.

The **Your countdowns** dashboard shows the live timer, progress, and an activity log. It has **Stop**, **Restore original** and **Retry** buttons. Each browser only sees its own countdowns.

## Getting an API key

1. Go to https://create.roblox.com/dashboard/credentials. If a group owns the game, switch to the group first.
2. **Create API Key**, then under **Access Permissions** add **Assets API** with **Read** and **Write**.
3. Under **Accepted IP Addresses**, add `0.0.0.0/0` or your server's IP.
4. Paste the key into the website.

The key is stored only on the machine that runs the server.

## Protected version vs. source (read this)

| Folder | What it is | Share it? |
|---|---|---|
| `icon-updater` (protected) | Scrambled code. It refuses to run if the credit is removed or changed. | ✅ Share or host this one |
| `icon-updater-SOURCE` | Your readable code | ❌ Keep this private |

After editing the source, rebuild the protected copy:

```
npm install --no-save javascript-obfuscator
node tools/build-protected.js
```

The new protected copy goes in `dist/`.

**Best protection:** host it yourself and share only the **link**. Visitors can use the website, but they never get the server files.

## Hosting online (optional)

You can run it on any host that runs Node (a VPS, Railway, Render with a disk, …). Set these environment variables:

| Setting | Purpose |
|---|---|
| `PORT` | The port to use. When it's set, the program listens publicly. |
| `ACCESS_PASSWORD` | Optional. The website asks for this password. |
| `DATA_DIR` | Where countdowns are saved. Use a disk that persists. |

## How it works

For each icon, the server uses Roblox Open Cloud to:
1. Upload the image (`POST /assets/v1/assets`).
2. Wait until Roblox has processed it.
3. Set it as the place icon (`PATCH /assets/v1/assets/{placeId}?updateMask=icon`).

Roblox moderates every new image, so a new icon can take a minute or two to appear for players. Each icon change adds one image to your Creations.

---
Icon Updater is not affiliated with or endorsed by Roblox Corporation.
Made by **superer325** · Discord: **oncefreedomreplies**
