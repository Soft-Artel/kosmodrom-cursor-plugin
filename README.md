<p align="center"><img src="assets/logo.png" width="96" alt="Kosmodrom"></p>

# Kosmodrom for Cursor

Connects Cursor to [Kosmodrom](https://kosmodrom.ai), a task tracker for product teams, through the Kosmodrom MCP
server. The agent in Cursor can read and update projects, features, tasks and bugs, work with team chats, worklogs
and agent memory, and read the code of the product repositories connected to Kosmodrom - on behalf of the signed-in
user and within their privileges.

## Servers

The plugin declares two connections to the same server - enable the one that fits:

| Server | Address | Sign-in |
|---|---|---|
| `kosmodrom` | `https://mcp.kosmodrom.ai` | OAuth: Cursor opens Kosmodrom sign-in and asks to allow access |
| `kosmodrom-token` | `https://mcp-pat.kosmodrom.ai` | Personal access token in the `KOSMODROM_TOKEN` variable |

A personal token is issued in the Kosmodrom profile, **AI agents** tab. Tokens have the `read` scope and, optionally,
`write`; a token can be revoked in the profile at any time.

## Install

- From the Cursor Marketplace: search for **Kosmodrom**.
- Locally: clone this repository into `~/.cursor/plugins/local/kosmodrom` and restart Cursor.

Then open **Settings → MCP** and enable `kosmodrom` (OAuth) or set `KOSMODROM_TOKEN` and enable `kosmodrom-token`.

## What the agent gets

- Tools to search and read tasks, features and products, create and update them, move tasks through their stages,
  read and write chat messages, read code of the product repositories.
- Workspace conventions and team notes, delivered by the server in the session and product context; the language of
  tool descriptions and conventions follows the company language (English or Russian).

Deleting data and releasing versions happen only at the user's explicit request.

## Docker MCP Catalog

`docker/server.yaml` is the entry for the [Docker MCP Catalog](https://github.com/docker/mcp-registry).

## License

[MIT](LICENSE)

---

## Кратко по-русски

Плагин подключает Cursor к MCP-серверу Космодрома. Сервер `kosmodrom` входит через OAuth (`https://mcp.kosmodrom.ai`),
`kosmodrom-token` - по персональному токену из профиля Космодрома, вкладка «AI Агенты» (`https://mcp-pat.kosmodrom.ai`,
переменная `KOSMODROM_TOKEN`). Включите один из двух.
