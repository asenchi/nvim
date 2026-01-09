vim.filetype.add({
  extension = {
    tf = "terraform",
    tofu = "terraform",
    tfvars = "terraform",
    hcl = "hcl",
    tfbackend = "hcl",
    tfstate = "json",
    ["tfstate.backup"] = "json",
  },
  pattern = {
    -- Matches specific filenames like .terraformrc or *.tftest.hcl
    [".*%.tftest%.hcl"] = "terraform",
    [".*%.tofutest%.hcl"] = "terraform",
    [".terraformrc"] = "hcl",
    ["terraform.rc"] = "hcl",
  },
})
