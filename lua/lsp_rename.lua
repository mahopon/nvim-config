-- LSP-aware file renaming
local function lsp_rename_file(old_name, new_name)
  local params = {
    files = {
      {
        oldUri = vim.uri_from_fname(old_name),
        newUri = vim.uri_from_fname(new_name),
      },
    },
  }

  -- Notify LSP servers before renaming
  vim.lsp.util.rename(old_name, new_name)

  -- Send rename request (if supported by LSP)
  vim.lsp.buf_request(0, "workspace/willRenameFiles", params, function(_, res)
    if res then
      vim.lsp.util.apply_workspace_edit(res, "utf-8")
    end
  end)

  -- Actually rename the file on disk
  os.rename(old_name, new_name)

  -- Reload buffer
  vim.cmd("edit " .. new_name)
end

-- Example keymap: rename current file with prompt
vim.keymap.set("n", "<leader>rf", function()
  local old_name = vim.fn.expand("%:p")
  local new_name = vim.fn.input("New filename: ", old_name, "file")
  if new_name ~= "" and new_name ~= old_name then
    lsp_rename_file(old_name, new_name)
  end
end, { desc = "LSP File Rename" })

