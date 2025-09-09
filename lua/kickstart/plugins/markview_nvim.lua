return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,
  config = function()
    require("markview").setup({
      experimental = {
        check_rtp_message = false,  -- Hides the warning message
        -- OR set check_rtp = false to disable the check entirely (not recommended)
      }
    })
  end
}

