return {
  cmd = {
	"lua-language-server",
  },
  filetypes = {
	"lua",
  },
  root_markers = {
	".git",
	".luacheckrc",
	".luarc.json",
	".luarc.jsonc",
	".stylua.toml",
	"selene.toml",
	"selene.yml",
	"stylua.toml",
  },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      workspace = {
        ignoreSubmodules = true,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
