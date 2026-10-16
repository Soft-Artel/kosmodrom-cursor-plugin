<p align="center"><img src="plugins/vscode/assets/logo.png" width="96" alt="Kosmodrom"></p>

# Kosmodrom plugins for Cursor, VS Code and GitHub Copilot

Connects your coding agent to [Kosmodrom](https://kosmodrom.ai), a task tracker for product teams, through the
Kosmodrom MCP server. The agent can read and update projects, features, tasks and bugs, work with team chats, worklogs
and agent memory, and read the code of the product repositories connected to Kosmodrom - on behalf of the signed-in
user and within their privileges.

## Plugins

| Plugin | Folder | Format | Clients |
|---|---|---|---|
| `kosmodrom` for Cursor | [`plugins/cursor`](plugins/cursor) | Cursor plugin (`.cursor-plugin/plugin.json`) | Cursor |
| `kosmodrom` for VS Code | [`plugins/vscode`](plugins/vscode) | [Agent Plugins 1.0](https://agent-plugins.org) (`plugin.json`, `mcp.json`) | VS Code (GitHub Copilot), Copilot CLI |

The repository is a plugin marketplace for both: `.cursor-plugin/marketplace.json` for Cursor and
`.github/plugin/marketplace.json` for VS Code and Copilot CLI.

## Servers

| Server | Address | Sign-in | Plugins |
|---|---|---|---|
| `kosmodrom` | `https://mcp.kosmodrom.ai` | OAuth: the client opens Kosmodrom sign-in and asks to allow access | Cursor, VS Code |
| `kosmodrom-token` | `https://mcp-pat.kosmodrom.ai` | Personal access token in the `KOSMODROM_TOKEN` variable | Cursor |

A personal token is issued in the Kosmodrom profile, **AI agents** tab. Tokens have the `read` scope and, optionally,
`write`; a token can be revoked in the profile at any time.

Agent Plugins 1.0 has no way to ask the user for a secret, so the VS Code plugin declares only the OAuth server.
To use a personal token in VS Code, install Kosmodrom from the MCP server gallery (`@mcp` in the Extensions view) and
choose the `mcp-pat.kosmodrom.ai` remote, or add the server to your `mcp.json` with an `${input:...}` variable.

## Install

**Cursor** - search for **Kosmodrom** in the Cursor Marketplace, or copy `plugins/cursor` into
`~/.cursor/plugins/local/kosmodrom` and restart Cursor. Then open **Settings → MCP** and enable `kosmodrom` (OAuth),
or set `KOSMODROM_TOKEN` and enable `kosmodrom-token`.

**VS Code (GitHub Copilot)** - enable `chat.plugins.enabled`, run **Chat: Install Plugin From Source** and enter
`Soft-Artel/kosmodrom-plugin`. Then start the `kosmodrom` server from the MCP server list and sign in to Kosmodrom.

**GitHub Copilot CLI**:

```sh
copilot plugin marketplace add Soft-Artel/kosmodrom-plugin
copilot plugin install kosmodrom@soft-artel
```

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

В репозитории два плагина Космодрома: для Cursor (`plugins/cursor`) и для VS Code с GitHub Copilot и Copilot CLI
(`plugins/vscode`, открытый формат Agent Plugins 1.0). Сервер `kosmodrom` входит через OAuth
(`https://mcp.kosmodrom.ai`) в обоих плагинах. В Cursor есть второй сервер, `kosmodrom-token`: вход по персональному
токену из профиля Космодрома, вкладка «AI Агенты» (`https://mcp-pat.kosmodrom.ai`, переменная `KOSMODROM_TOKEN`).
В VS Code вход по токену доступен через галерею MCP (`@mcp`).

Установка в VS Code: команда **Chat: Install Plugin From Source** → `Soft-Artel/kosmodrom-plugin`.
