--- config.lua references in link:
-- https://docs.coronalabs.com/guide/basics/configSettings/index.html

_G.application = {
    content = {
        width = 320,
        height = 480,
        scale = "letterbox",
        xAlign = "center",
        yAlign = "center",
        fps = 60,

        -- enable to set high precision floating point operation
        -- shaderPrecision = "highp",
    },
    license = {
        google =  {
            key = "",
        },
    },
}
