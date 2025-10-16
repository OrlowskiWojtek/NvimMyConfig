return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    

    config = function ()
        require("markview.highlights").setup();
    end

    -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
};
